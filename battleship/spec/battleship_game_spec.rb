require_relative '../model/battleship_game'
require_relative '../model/ship'
require_relative '../model/fire_result'

describe BattleshipGame do
  subject { described_class.new }
  let(:position_a) { 'A' }
  let(:position_b) { '1' }

  it { expect(subject).to be_empty }

  describe '#place_ship_horizontally' do
    let(:ship) { double('Ship') }
    let(:true_value) { double('True') }

    before :each do
      allow(subject).to receive(:build_destructor) { ship }
      allow(subject).to receive(:place_horizontally).with(ship, position_a, position_b) { true_value }
      @result = subject.place_ship_horizontally position_a, position_b
    end

    it { expect(subject).to have_received(:build_destructor) }
    it { expect(subject).to have_received(:place_horizontally).with(ship, position_a, position_b) }
    it { expect(@result).to be(true_value) }
  end

  describe '#build_desctructor' do
    it { expect(subject.build_destructor).to be_an_instance_of(Ship) }
  end

  describe '#place' do
    let(:ship) { Ship.new }

    context 'with a empty board' do
      before :each do
        subject.place_horizontally ship, position_a, position_b
      end

      it { expect(subject).to_not be_empty }

      it { expect(subject).to be_taken position_a, position_b }
    end
  end
end
