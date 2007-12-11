# AutoZest::Config
module AutoZest
  class Config
    # Setup config and read in yml configuration file.
    class << self

      attr_accesssor :config

      @config ||= Erubis.load_yaml_file("~/.autozest/config.yml")

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
