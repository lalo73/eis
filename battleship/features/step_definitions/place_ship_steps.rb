require_relative '../../model/battleship_game'

Given(/^an empty board$/) do
  @game = BattleshipGame.new
end

When(/^I place a destructor in (\w+)(\d+) horizontally$/) do |positionA, positionB|
  @game.place_ship_horizontally positionA, positionB
end

Then(/^my ship is in the board at (\w+)(\d+)$/) do |positionA, positionB|
  expect(@game).to be_taken(positionA, positionB)
end

Given(/^a board with a destructor in (\w+)(\d+)$/) do |positionA, positionB|
  @game = BattleshipGame.new
  @game.place_ship_horizontally positionA, positionB
end

When(/^I try to place my desctructor in (\w+)(\d+)$/) do |positionA, positionB|
  @result = @game.place_ship_horizontally positionA, positionB
end

Then(/^my ship is not in the board at (\w+)(\d+)$/) do |positionA, positionB|
  expect(@game).to be_taken(positionA, positionB)
  expect(@result).to be_falsy
end