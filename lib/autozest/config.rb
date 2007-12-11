# AutoZest::Config
module AutoZest
  class Config

    # Setup config and read in yml configuration file.
    class << self      
      @user ||= `whoami`.strip
      @@config_file = "/Users/#{@user}/.autozest/config.yml"
      @@config ||= Erubis.load_yaml_file(@@config_file)

      # Allow for calling keys as methods on Config object
      #def method_missing(method,*arguments)
      #  if config.has_key?(method.to_sym)
      #    config[method]
      #  else
      #    super(method,*arguments)
      #  end
      #end

    end

    # direct config lookup
    # AutoZest::Config[:some_key]
    def self.[](key)
      @@config[key]
    end

  end

end
