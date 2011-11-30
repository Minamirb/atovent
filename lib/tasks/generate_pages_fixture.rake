desc "Generate pages fixture"
task "generate:pages" do
  require 'uric'
  require 'yaml'

  url_list = ["http://t.co/X87gPn7b",
              "http://t.co/qp7zQ6XJ",
              "http://t.co/cbn6mHMX",
              "http://t.co/zIJGo6oF",
              "http://t.co/RE3VDFVV",
              "http://t.co/4MKS336j",
              "http://t.co/rlycjFzJ",
              "http://t.co/CLbzel3E",
              "http://t.co/ko3hlvGh",
              "http://t.co/CzYZfN5u",
              "http://t.co/XYherfH2"]

  pages_yml = {}
  url_list.each do |url|
    p url
    obj = Uric::URI.new(url)
    pages_yml[obj.path_origin] = {:title => obj.title, :url => obj.path, :host => obj.host, :type => obj.type}
  end
  
  open(File.join(Dir.pwd, 'test/fixtures/pages.yml'), 'w') do |f|
    f.write(YAML.dump(pages_yml))
  end
end
