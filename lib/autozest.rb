require "yaml"
require "erubis"
#require "sequel"
# http://code.google.com/p/ruby-sequel/wiki/CheatSheetrequire "#{File.dirname(__FILE__)}/autozest/installer"

require "#{File.dirname(__FILE__)}/autozest/config"
require "#{File.dirname(__FILE__)}/autozest/notifier"
require "#{File.dirname(__FILE__)}/autozest/updater"
require "#{File.dirname(__FILE__)}/autozest/generator"
require "#{File.dirname(__FILE__)}/autozest/installer"

module AutoZest
  Version = "0.0.1"
end
