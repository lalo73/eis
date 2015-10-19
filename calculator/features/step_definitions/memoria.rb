When(/^no hice operaciones$/) do
  visit "/"
end

Then(/^la cantidad de operaciones es (\d+)$/) do |n|
  expect(page).to have_content("Cantidad de operaciones: #{n}")
end

When(/^hago una suma$/) do
  visit "/"
  with_scope("#calculator") do
    fill_in("operand1", :with => 2)
    fill_in("operand2", :with => 4)
    select("plus", :from => "operation")
    click_button("submit")
  end
end

When(/^hago una resta$/) do
  visit "/"
  with_scope("#calculator") do
    fill_in("operand1", :with => 2)
    fill_in("operand2", :with => 4)
    select("subtraction", :from => "operation")
    click_button("submit")
  end
end

