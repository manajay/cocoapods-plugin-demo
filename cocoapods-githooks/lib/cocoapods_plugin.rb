require 'cocoapods-githooks/command'
require 'cocoapods-githooks/githooks-sync'

module CocoapodsGitHooks
    Pod::HooksManager.register('cocoapods-githooks', :post_install) do
        GitHooksSync.new.sync()
    end
    Pod::HooksManager.register('cocoapods-githooks', :post_update) do
        GitHooksSync.new.sync()
    end
end