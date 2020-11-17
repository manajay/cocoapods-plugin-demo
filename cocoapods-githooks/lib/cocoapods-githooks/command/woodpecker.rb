require 'cocoapods'
require 'cocoapods-githooks/githook-woodpecker'
include CocoapodsProjInfo

module Pod
    class Command
      class Woodpecker < Command
        self.summary = <<-SUMMARY
            config woodpeckeriOS 
        SUMMARY
        self.description = <<-DESC
            CocoaPods plugins that update woodpeckeriOS configs
        DESC
        self.arguments = []
        def run
            CocoapodsProjInfo::WoodPeckerConfig.new.config_tcp()
        end
      end
    end
  end
  