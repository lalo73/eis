require_relative '../model/battleship_game'
require_relative '../model/ship'

describe BattleshipGame do
  subject { described_class.new }

  it { expect(subject).to be_empty }

  describe '#build_desctructor' do
    it { expect(subject.build_destructor).to be_an_instance_of(Ship) }
  end

  describe '#place' do
    let(:ship) { Ship.new }
    let(:positionA) { "A" }
    let(:positionB) { "1" }

    context 'with a empty board' do
      before :each do
        subject.place_horizontally ship, positionA, positionB
      end

      it {expect(subject).to_not be_empty}

      #it {expect(subject.taken? positionA, positionB).to be_true}

    end
  end
end
