current_dir = Dir.pwd

if current_dir =~ /^(.*?\/mws)$/
  require 'dotenv'
  Dotenv.load('./.env')

  unless ENV['BUNDLE_BIN_PATH'].nil?
    # Monkeypatch Net::HTTP for complete HTTP logging in pry
    module Net
      class HTTP
        alias_method '__initialize__', 'initialize'

        def initialize(*args,&block)
          __initialize__(*args, &block)
        ensure
          @debug_output = $stderr ### if ENV['HTTP_DEBUG']
        end
      end
    end
  else
    # Add lib dir to $LOAD_PATH if not in context of bundle
    $:.unshift('./lib/') unless $:.include?('./lib/')
  end

  require 'mws'
  Mws.log = true
  mws = Mws.new

  puts '================================================================================='
  puts "  In \033[32m\033[1mMWS Library\033[0m: initialized AMWS environment vars"
  puts "  In \033[32m\033[1mMWS Library\033[0m: added './lib/' to load path"
  puts "  In \033[32m\033[1mMWS Library\033[0m: Mws instance available as \033[32mmws\033[0m"
  puts '================================================================================='
end
