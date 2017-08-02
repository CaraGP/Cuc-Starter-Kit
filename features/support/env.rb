require "Capybara"
require "Capybara/cucumber"
require "rspec"
require 'capybara/poltergeist'
require 'yaml'

Capybara.default_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
    options = {
        :js_errors => true,
        :timeout => 120,
        :debug => false,
        :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
        :inspector => true,
    }
    Capybara::Poltergeist::Driver.new(app, options)
end

$pages = YAML.load_file Dir.pwd + "/features/mappings/pages.yml"
$elements = YAML.load_file Dir.pwd + "/features/mappings/elements.yml"