current_dir = Dir.pwd

if current_dir =~ /^(.*?\/mws)$/
  $:.unshift('./lib/') unless $:.include?('./lib/')
  puts '================================================================================='
  puts "  In \033[32m\033[1mMWS Library\033[0m: added './lib/' to load path"
  puts '================================================================================='
end
