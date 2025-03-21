return {
    about = "ospf configurations",
    end_config = "exit\n",
    init = function(config, param)
        if not param then
            print("Please provide the argument that is required: *ospf({pid = <PID>})*")
            return nil
        end
        if not param['pid'] then
            print("Please provide the pid of ospf: *ospf({pid = <PID>})*")
            return nil
        else
            config['pid'] = param['pid']
        end
        return config
    end,
    config = function(config_table)
        local conf = string.format("router ospf %d\n", config_table['pid'])
        if config_table['router_id'] then
            conf = conf .. "router-id " .. tostring(config_table['router_id']) .. '\n'
        end

        return string.sub(conf, 1, #conf - 1)
    end,
    args = {
        pid = {
            required = true,
            help = "configure ospf process id"
        },
        router_id = {
            help = "configure ospf router id",
            arg_type = "IpAddress"
        },
        passive_interface = {
            short = "P",
            action = "store-table",
            help = "add passive interface"
        },
        network = {
            help = "add network to distribute in ospf",
            action = "store-table",
        }
    }
}
