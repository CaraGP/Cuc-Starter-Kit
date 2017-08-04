require "Capybara"
require "Capybara/cucumber"
require "rspec"
require 'capybara/poltergeist'
require 'yaml'
require 'capybara-screenshot/cucumber'
require 'fileutils'
require 'Capybara/node/element'
require 'net/http'
require 'nokogiri'

Capybara.default_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
    options = {
        :js_errors => true,
        :timeout => 120,
        :debug => false,
        :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
        :inspector => true,
        :phantomjs_logger => File.open("phantomjs.log", "a")
    }
    Capybara::Poltergeist::Driver.new(app, options)
end

$mappings = {}

Dir.entries(Dir.pwd + "/features/mappings").each { |file|
  if file != "." && file != ".." then
    mappings_name = file.split('.')[0]
    $mappings[mappings_name] = YAML.load_file Dir.pwd + "/features/mappings/" + file
  end
 }

#FileUtils.remove_dir("screenshots")
#Capybara.save_path = "screenshots"