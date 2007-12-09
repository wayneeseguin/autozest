require "rubigen/helpers/generator_test_helper"
require File.join(File.dirname(__FILE__), "spec_helper")

# Left to describe:
# how we're going to interface between autotest <-> autozest
# It'll be by hooking in obviously, but how...

describe AutoZest::Generator do

  it "should generate an ~/.autotest config file for Growl"

  it "should generate an ~/.autozest config file"

end

describe AutoZest::Notifier do # this is what does the work during autotest
  
  it "should pull custom failure messages out of the sqllite database and send them to growl"
  
  it "should base failure message on the percentile of failure"

  it "should allow for custom specification of images URI" do
    pending("implement above first")
  end

  it "should allow for custom specification of messages URI" do
    pending("implement above first")
  end

  it "should have support for gnome notifier" do
    pending("working version in OSX first")
  end

end

describe AutoZest::Updater do

  it "should update the autozest.sqlite3 database file from (rubyforge)?" do
    pending("implement notifier first")
  end

end

describe AutoZest::Installer, "growl" do
  
  it "should download & install growl" do
    pending("implement other features first")
  end

  
  it "should download & install growlnotify" do
    pending("implement other features first")
  end
  
end
