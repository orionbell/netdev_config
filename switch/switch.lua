return {
    about = "router configuration",
    config = function(config)
        local conf = ""
        if config["hostname"] then
            conf = conf .. "hostname " .. config["hostname"] .. "\n"
        end
        if config["enable_secret"] then
            conf = conf .. "enable secret " .. config["enable_secret"] .. "\n"
        end
        if config["enable_password"] then
            conf = conf .. "enable password " .. config["enable_password"] .. "\n"
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
        return conf
    end,
    args = {
        hostname = {
            help = "configure router hostname",
            short = "H",
        },
        secret = { help = "configure router enable secret"},
        password = {
            help = "configure router enable password",
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
    }
}
