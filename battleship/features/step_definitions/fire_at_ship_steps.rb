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

Given(/^a board with an almost sunk destructor in (\w+)(\d+)$/) do |x, y|
  @game = BattleshipGame.new
  @game.place_ship_horizontally x, y
  (0...2).each do |n|
    @game.fire_at x, y.to_i + n
  end
end

Then(/^the ship is sunk$/) do
  expect(@result).to be_sunk
end
