Then(/^I should see the "([^"]*)"$/) do |element|
  page.find $mappings["elements"][element]
end
