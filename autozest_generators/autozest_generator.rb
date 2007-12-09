class AutoZestGenerator < RubiGen::Base
  default_options :author => nil

  attr_reader :name, :class_name, :file_name, :provided_args

  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    # @name = args.shift
    @provided_args = runtime_args
    # @class_name = args.first.camel_case
    extract_options
  end

  def manifest
    record do |m|
      #singularize the model & pluralize the name of the controller
      model_args = provided_args.dup
      controller_args = provided_args.dup

      model_args[0] = model_args.first.singularize
      controller_args[0] = controller_args.first.pluralize

      m.dependency "model", model_args, options.dup
      m.dependency "resource_controller", controller_args, options.dup
    end
  end

  protected
  def banner
    "Creates the ~/.autozest.yml file with a default configuration."
  end

  def add_options!(opts)
    # opts.separator ''
    # opts.separator 'Options:'
    # For each option below, place the default
    # at the top of the file next to "default_options"
    # opts.on("-a", "--author=\"Your Name\"", String,
    #         "Some comment about this option",
    #         "Default: none") { |options[:author]| }
    # opts.on("-v", "--version", "Show the #{File.basename($0)} version number and quit.")
  end

  def extract_options
    # for each option, extract it into a local variable (and create an "attr_reader :author" at the top)
    # Templates can access these value via the attr_reader-generated methods, but not the
    # raw instance variable value.
    # @author = options[:author]
  end

end
