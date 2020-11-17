require 'Plist'

module CocoapodsProjInfo

    class WoodPeckerConfig
        def config_tcp
            bonjour_key = "NSBonjourServices"
            tcp_value = "_adhp._tcp"
            path = "TSPodHook/Info.plist"
            result = Plist.parse_xml(path)
            if result.include?(bonjour_key)
                if !result[bonjour_key].include?(tcp_value)
                    result[bonjour_key] << tcp_value
                    Plist::Emit.save_plist(result, path)
                end
            else
                result[bonjour_key] = [tcp_value]
                Plist::Emit.save_plist(result, path)
            end

            puts "==========="
            puts bonjour_key + ":" + result[bonjour_key].to_s
            puts "==========="
        end
    end
end