require 'cocoapods'
require 'fileutils'
module CocoapodsGitHooks
    class GitHooksSync
        def sync
            if !File.directory?(".git")
                Pod::UI.puts "Git repository not found"
                return
            end
            if !File.directory?(".git-hooks")
                Pod::UI.puts ".git-hooks directory not found, nothing to sync"
                return
            end
            if Dir['.git-hooks/*'].empty?
                Pod::UI.puts ".git-hooks directory is empty, nothing to sync"
                return
            end
            if !File.directory?(".git/hooks")
                FileUtils.mkdir ".git/hooks"
            end
            FileUtils.cp_r(".git-hooks/.", ".git/hooks/")
            path = ".git/hooks/"
            Pod::UI.puts "======================= Git hooks begin ======================="
            Dir.open(path).each do |p|
                filename = File.basename(p, File.extname(p))
                if File.extname(p) == ".sh"
                    FileUtils.mv("#{path}/#{p}", "#{path}/#{filename}")
                    FileUtils.chmod(0755, "#{path}/#{filename}")
                    Pod::UI.puts "chmod 755 " + "#{path}/#{filename}" + " done"
                end
            end
            Pod::UI.puts "======================= Git hooks synchronized ======================="
        end
    end
end