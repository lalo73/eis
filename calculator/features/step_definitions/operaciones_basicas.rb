Given(/^voy a la pagina de la calculadora$/) do
  visit "/"
end

Given(/^un operando es (\d+)$/) do |n|
  with_scope("#calculator") do
    fill_in("operand1", :with => n)
  end
end

Given(/^otro operando es (\d+)$/) do |n|
  with_scope("#calculator") do
    fill_in("operand2", :with => n)
  end
end

When(/^los sumo$/) do
  with_scope("#calculator") do
    select("plus", :from => "operation")
    click_button("submit")
  end
end

When(/^los resto$/) do
  with_scope("#calculator") do
    select("subtraction", :from => "operation")
    click_button("submit")
  end
end

When(/^los promedio$/) do
  with_scope("#calculator") do
    select("average", :from => "operation")
    click_button("submit")
  end
end

Then(/^el resultado es (\d+)$/) do |n|
  expect(page).to have_content("Resultado: #{n}")
end
