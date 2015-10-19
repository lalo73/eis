When(/^no hice operaciones$/) do
  visit "/"
end

Then(/^la cantidad de operaciones es (\d+)$/) do |n|
  expect(page).to have_content("Cantidad de operaciones: #{n}")
end
