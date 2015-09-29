require 'spec_helper'
require_relative '../model/game'

describe Game do

  let(:player_1) { double("Player") }
  let(:player_2) { double("Player") }
  subject { described_class.new player_1, player_2 }

  it 'expect player 2 to win in round 3' do
    allow(player_1).to receive(:beats?).with(player_2).and_return(true, false, false)
    3.times { subject.play! }
    expect(subject.winner).to eq(player_2)
  end
  
end
