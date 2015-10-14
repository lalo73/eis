When(/^I fire at (\w+)(\d+) position$/) do |x, y|
  @result = @game.fire_at x, y
end

When(/^I fire at an empty position (\w+)(\d+)$/) do |x, y|
  @result = @game.fire_at x, y
end


Then(/^it hits the water$/) do
  expect(@result).to be_water
end

Then(/^it hits the ship$/) do
  expect(@result).to be_touch
end
