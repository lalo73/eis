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
