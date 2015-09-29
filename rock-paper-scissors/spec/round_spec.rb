require 'spec_helper'
require_relative '../model/player'

describe "Round" do
  let(:player_1) { Player.new }
  let(:player_2) { Player.new }

  let(:paper_player) { player(&:paper!) }
  let(:rock_player) { player(&:rock!) }
  let(:scissors_player) { player(&:scissors!) }
  let(:monkey_player) { player(&:monkey!) }

  it { expect(paper_player).to beat(rock_player) }

  it { expect(paper_player).to_not beat(scissors_player) }

  it 'expect paper to not beat paper' do
    player_2.paper!
    expect(paper_player).to_not beat(player_2)
  end

  it { expect(paper_player).to_not beat(monkey_player) }

  it { expect(rock_player).to beat(scissors_player) }

  it { expect(rock_player).to_not beat(monkey_player) }

  it { expect(rock_player).to_not beat(paper_player) }

  it 'expect rock to not beat rock' do
    player_2.rock!
    expect(rock_player).to_not beat(player_2)
  end

  it { expect(scissors_player).to beat(paper_player) }

  it { expect(scissors_player).to_not beat(rock_player) }

  it { expect(scissors_player).to beat(monkey_player) }

  it 'expect scissors to not beat scissors' do
    player_2.scissors!
    expect(scissors_player).to_not beat(player_2)
  end

  it { expect(monkey_player).to beat(paper_player) }

  it { expect(monkey_player).to_not beat(rock_player) }

  it { expect(monkey_player).to_not beat(scissors_player) }

  it 'expect monkey to not beat monkey' do
    player_2.monkey!
    expect(monkey_player).to_not beat(player_2)
  end
end
