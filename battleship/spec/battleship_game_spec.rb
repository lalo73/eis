require_relative '../model/battleship_game'
require_relative '../model/ship'
require_relative '../model/fire_result'

describe BattleshipGame do
  subject { described_class.new }
  let(:positionA) { "A" }
  let(:positionB) { "1" }

  it { expect(subject).to be_empty }

  describe '#place_ship_horizontally' do

    let(:ship) { double("Ship") }
    let(:true_value) { double("True") }

    before :each do
      allow(subject).to receive(:build_destructor) { ship }
      allow(subject).to receive(:place_horizontally).with(ship, positionA, positionB) { true_value }
      @result = subject.place_ship_horizontally positionA, positionB
    end

    it { expect(subject).to have_received(:build_destructor) }
    it { expect(subject).to have_received(:place_horizontally).with(ship, positionA, positionB) }
    it { expect(@result).to be(true_value) }
  end

  describe '#build_desctructor' do
    it { expect(subject.build_destructor).to be_an_instance_of(Ship) }
  end

  describe '#fire_at' do
    context 'with a empty position' do
      it { expect(subject.fire_at positionA, positionB).to an_instance_of(FireResult) }
      it { expect(subject.fire_at positionA, positionB).to be_water }
      it { expect(subject.fire_at positionA, positionB).to_not be_touch }
      #it { expect(subject.fire_at positionA, positionB).to_not be_sunk }
    end
=begin
    context 'with a ship at A1' do
      it { expect(subject.fire_at positionA, positionB).to an_instance_of(FireResult) }
      it { expect(subject.fire_at positionA, positionB).to_not be_water }
      it { expect(subject.fire_at positionA, positionB).to be_touch }
      it { expect(subject.fire_at positionA, positionB).to_not be_sunk }
    end

    context 'with an almost sunk ship at A1' do
      before :each do
        subject.fire_at positionA, positionB
        subject.fire_at positionA, (positionB + 1)
      end
      it { expect(subject.fire_at positionA, positionB).to an_instance_of(FireResult) }
      it { expect(subject.fire_at positionA, positionB).to_not be_water }
      it { expect(subject.fire_at positionA, positionB).to_not be_touch }
      it { expect(subject.fire_at positionA, positionB).to be_sunk }
    end
=end
  end

  describe '#place' do
    let(:ship) { Ship.new }

    context 'with a empty board' do
      before :each do
        subject.place_horizontally ship, positionA, positionB
      end

      it {expect(subject).to_not be_empty}

      it {expect(subject).to be_taken positionA, positionB}

    end
  end
end
