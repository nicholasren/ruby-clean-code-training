class Car
    def method_missing(name, *args)
        mname = name.to_s
        super unless name =~ /(_info)=?$/
        if mname =~ (/=$/)
            instance_variable_set("@#{mname.chop}", args.first)
        else
            instance_variable_get("@#{mname}")
        end
    end
end
