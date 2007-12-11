# AutoZest::Config
module AutoZest
  class Config
    # Setup config and read in yml configuration file.
    class << self
      @config_file = "~/.autozest/config.yml"
#      @config ||= YAML::load(Erubis::Eruby.new(File.read(File.expand_path(@config_file))))

      # direct config lookup
      # AutoZest::Config[:some_key]
      def [](key)
        config[key]
      end
      
      # Allow for calling keys as methods on Config object
      def method_missing(method,*arguments)
        if config.has_key?(method.to_sym)
          config[method]
        else
          super(method,*arguments)
        end
      end

    end

  end
end
