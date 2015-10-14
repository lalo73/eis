require_relative '../../model/battleship_game'

Given(/^an empty board$/) do
  @game = BattleshipGame.new
end

When(/^I place a destructor in (\w+)(\d+) horizontally$/) do |position_a, position_b|
  @game.place_ship_horizontally position_a, position_b
end

Then(/^my ship is in the board at (\w+)(\d+)$/) do |position_a, position_b|
  expect(@game).to be_taken(position_a, position_b)
end

Given(/^a board with a destructor in (\w+)(\d+)$/) do |position_a, position_b|
  @game = BattleshipGame.new
  @game.place_ship_horizontally position_a, position_b
end

When(/^I try to place my desctructor in (\w+)(\d+)$/) do |position_a, position_b|
  @result = @game.place_ship_horizontally position_a, position_b
end

Then(/^my ship is not in the board at (\w+)(\d+)$/) do |position_a, position_b|
  expect(@game).to be_taken(position_a, position_b)
  expect(@result).to be_falsy
end

Given(/^a board of size (\d+)x(\d+)$/) do |x, y|
  @game = BattleshipGame.new x.to_i, y.to_i
end

Then(/^my ship is not in the board$/) do
  expect(@result).to be_falsy
end
