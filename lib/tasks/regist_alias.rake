desc "Regist host alias"
task "regist:host", "host", "alias" do |x, args|
  require 'uric'
  obj = Uric::URI.new
  obj.add_host_alias(args.host, args.alias)
  puts "#{obj.dic["hosts"][args.host]} regitered."
end

desc "Regist file-type alias"
task "regist:type", "type", "alias" do |x, args|
  require 'uric'
  obj = Uric::URI.new
  obj.add_type_alias(args.type, args.alias)
  puts "#{obj.dic["types"][args.type]} regitered."
end

desc "Remove host alias"
task "remove:host", "host" do |x, args|
  require 'uric'
  obj = Uric::URI.new
  obj.remove_host_alias(args.host)
  puts "#{args.host} removed."
end

desc "Remove file-type alias"
task "remove:type", "type" do |x, args|
  require 'uric'
  obj = Uric::URI.new
  obj.remove_type_alias(args.type)
  puts "#{args.type} removed."
end
