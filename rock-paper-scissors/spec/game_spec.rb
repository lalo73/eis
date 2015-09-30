require 'spec_helper'
require_relative '../model/game'
require_relative '../model/player'
require_relative '../exceptions/round_limit_exceded'

describe Game do
  subject { described_class.new player_1, player_2 }

  describe 'unitest' do
    let(:player_1) { double("Player") }
    let(:player_2) { double("Player") }

    it 'expect player 2 to win in round 3' do
      allow(player_1).to receive(:beats?).with(player_2).and_return(true, false, false)
      allow(player_2).to receive(:beats?).with(player_1).and_return(false, true, true)
      3.times { subject.play! }
      expect(subject.winner).to eq(player_2)
    end

    it 'expect player 1 to win in last 2 rounds' do
      allow(player_1).to receive(:beats?).with(player_2).and_return(false, true, true)
      allow(player_2).to receive(:beats?).with(player_1).and_return(false, false, false)
      3.times { subject.play! }
      expect(subject.winner).to eq(player_1)
    end  

    it 'expect player 1 to win' do
      allow(player_1).to receive(:beats?).with(player_2).and_return(true, true, false)
      allow(player_2).to receive(:beats?).with(player_1).and_return(false, false, false)
      3.times { subject.play! }
      expect(subject.winner).to eq(player_1)
    end

    it 'expect no winner with just 1 round played' do
      allow(player_1).to receive(:beats?).with(player_2).and_return(true)
      allow(player_2).to receive(:beats?).with(player_1).and_return(false)
      subject.play!
      expect(subject.winner).to be_nil
    end

    it 'expect to not have a winner' do
      allow(player_1).to receive(:beats?).with(player_2).and_return(true, false, false)
      allow(player_2).to receive(:beats?).with(player_1).and_return(false, true, false)
      3.times { subject.play! }
      expect(subject.winner).to be_nil
    end

    it 'expect to fail if game is player more than 3 times' do
      allow(player_1).to receive(:beats?).with(player_2).and_return(true)
      allow(player_2).to receive(:beats?).with(player_1).and_return(false)
      3.times { subject.play! }
      expect { subject.play! }.to raise_error(RoundLimitExceded)
    end
  end
  #Kinda integration test
  describe 'integration test' do
    let(:player_1) { Player.new }
    let(:player_2) { Player.new }
    it 'expect a player to win if it beat twice' do
      player_1.rock!
      player_2.scissors!
      subject.play!

      player_1.paper!
      player_2.rock!
      subject.play!

      expect(subject.winner).to eq(player_1)
    end

    it 'expect a player to win if beats twice in any order' do
      player_1.paper!
      player_2.rock!
      subject.play!

      player_1.paper!
      player_2.scissors!
      subject.play!

      player_1.monkey!
      player_2.paper!
      subject.play!

      expect(subject.winner).to eq(player_1)
    end
  end
end
