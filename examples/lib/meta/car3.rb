class Car
    def self.features(*args)
        args.each do |feature|
            attr_accessor "#{feature}_info", "#{feature}_price"
        end
    end

    features :engine, :wheel, :airbag, :alarm, :stereo
end
