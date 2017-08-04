When(/^I visit "([^"]*)"$/) do |page|
  visit $mappings["pages"][page]
end
