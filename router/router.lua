return {
    about = "router configuration",
    init = function(config, _)
        return config
    end,
    config = function(config)
        local conf = ""
        if config["hostname"] then
            conf = conf .. "hostname " .. config["hostname"] .. "\n"
        end
        if config["secret"] then
            conf = conf .. "enable secret " .. config["secret"] .. "\n"
        end
        if config["password"] then
            conf = conf .. "enable password " .. config["password"] .. "\n"
        end
        if config["enable_ipv6"] then
            conf = conf .. "ipv6 unicast-routing\n"
        elseif config["enable_ipv6"] == false then
            conf = conf .. "no ipv6 unicast-routing\n"
        end
        if config["password_enc"] then
            conf = conf .. "service password-encryption\n"
        elseif config["password_enc"] == false then
            conf = conf .. "no service password-encryption\n"
        end
        if config['ospf'] then
            conf = conf .. config['ospf']:config()
        end
        return conf
    end,
    args = {
        hostname = {
            help = "configure router hostname",
            short = "H",
        },
        secret = "configure router enable secret",
        password = "configure router enable password",
        enable_ipv6 = {
            help = "enable ipv6 on the router",
            arg_type = "bool",
            short = "6",
            action = "store-true",
        },
        password_enc = {
            help = "configure router password encryption service",
            short = "e",
            arg_type = "bool",
            action = "store-true",
            long = "password-encryption",
        },
    },
    subcommands = {
        ospf = require("plugins.netdev.router.ospf"),
    }
}
