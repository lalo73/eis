require 'spec_helper'
require_relative '../model/game'

describe Game do

  let(:player_1) { double("Player") }
  let(:player_2) { double("Player") }
  subject { described_class.new player_1, player_2 }

  it 'expect player 2 to win in round 3' do
    allow(player_1).to receive(:beats?).with(player_2).and_return(true, false, false)
    allow(player_2).to receive(:beats?).with(player_1).and_return(false, true, true)
    3.times { subject.play! }
    expect(subject.winner).to eq(player_2)
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
  
end
