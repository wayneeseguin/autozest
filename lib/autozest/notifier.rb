module AutoZest
  class Notifier    
    class << self

      attr_accessor :examples, :failures, :pending

      # Sends the command to the console (Only supports Growl at the moment)
      def notify!(results)
        parse(results)
        # TODO: this should all come from config
        if AutoZest::Config[:notifier] == "gnome"
          # TODO: deal with it :-p
        else
          # default is growl
          cmd = AutoZest::Config[:notifier_uri]
          cmd << " -a #{AutoZest::Config[:application]}" # name of the app?
          cmd << " -n #{AutoZest::Config[:application]}" # the name of the application that sends the notification, default: growlnotify
          cmd << " --image #{image}" if image
          cmd << " -m '#{message}'"
          cmd << " --title #{title}" unless title.empty?
        end
        puts "AutoZest: <i> #{message}"
        system(cmd)
      end

      private

      # returns a message string based on the number of failures
      def message
        # for now we'll test with this
        # TODO: hookup to database
        # "SELECT message FROM messages ORDER BY failures DESC WHERE severity <= #{failures}").first
        if failures <= 0
          "w00t!!! All #{@examples} examples passed!!!" # You want me to copy it over or do you got it? I remember there being something funky with SEE
        elsif failures  < 10
          "Cleanup aisle #{failures}... there were #{failures} failing specs)."
        elsif failures < 25
          "Reconstruction time... there were #{failures} failing spec."
        elsif failures < 50
          "Things are getting pretty bad... #{failures} failing specs!!!"
        elsif failures > 50
          "Dude, you really messed up... #{failures} failing specs!!!"
        elsif failures > 100
          "is anyone looking? Quick, revert! #{failures} failing specs!!!"
        elsif failures > 200
          "is the computer even on? (#{failures} failing specs!!! "
        else
          "There was an error running the specs"
        end

      end

      # returns a image URI based on the number of errors
      def image
        # For now:
        if failures <= 0
          # "~/.autozest/images/pass.png"
          AutoZest::Config[:images][:pass_uri]
        elsif failures > 0
          AutoZest::Config[:images][:fail_uri]
          # "~/.autozest/images/fail.png"
        end
      end

      # returns a string representing the title.
      def title
        # TODO: implement this, gNotify requires a title?
        # To be compatible with gNotify the following switch is accepted:
        #     -t,--title      Does nothing. Any text following will be treated as the
        #                     title because that's the default argument behaviour
        ""
      end

      def parse(results)
        # TODO: Verifiy that test / test::unit both spitout errors in the 
        #       same order as rspec. If not we have to adjust below slightly.
        @examples, @failures, @pending = results.scan(/(\d+)/).map{ |d| d.first.to_i }
      end

    end

  end

end