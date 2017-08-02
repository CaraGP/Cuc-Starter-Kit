Then(/^I should see the "([^"]*)"$/) do |element|
  page.find $elements[element]
end
