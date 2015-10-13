require 'rspec'
require_relative '../model/board'
require_relative '../model/ship'

describe Board do
  subject { described_class.new }

  let(:positionA) { "A" }
  let(:positionB) { "1" }

  let(:vertical_ship) { double("Ship", horizontally?: false, vertically?: true, vertically?: true,vertically!: nil, lenght: 3) }
  let(:horizontal_ship) { double("Ship", horizontally?: true,horizontally!: nil, lenght: 3) }

  it { expect(subject).to be_empty }

  describe '#taken?' do
    it {expect(subject).to_not be_taken(positionA, positionB)}

    context 'after calling #place_horizontally' do
      let(:ship) { horizontal_ship }
      before :each do
        subject.place_horizontally ship, positionA, positionB
      end

      it {expect(subject).to be_taken(positionA, positionB)}

      it "takes until ship's lenght" do
        delta_position = positionB.to_i + ship.lenght - 1
        expect(subject).to be_taken(positionA, delta_position)
      end

      it "doesn't take more than ship's lenght" do
        delta_position = positionB.to_i + ship.lenght
        expect(subject).to_not be_taken(positionA, delta_position)
      end
    end

    context 'after calling #place_vertically' do
      let(:ship) { vertical_ship }
      before :each do
        subject.place_vertically ship, positionA, positionB
      end

      it {expect(subject).to be_taken(positionA, positionB)}

      it "takes until ship's lenght" do
        delta_position = (positionA.ord + ship.lenght - 1).chr
        expect(subject).to be_taken(delta_position, positionB)
      end

      it "doesn't take more than ship's lenght" do
        delta_position = (positionA.ord + ship.lenght).chr
        expect(subject).to_not be_taken(delta_position, positionB)
      end
    end

  end

  describe '#place_horizontally' do
    let(:ship) { horizontal_ship }

    it {expect(subject.place_horizontally ship, positionA, positionB).to eq(true)}

    context 'after placing a ship' do
      before :each do
        subject.place_horizontally ship, positionA, positionB
      end

      it {expect(subject).to_not be_empty}
      it {expect(ship).to have_received(:horizontally!)}

    end
  end

  describe '#place_vertically' do
    let(:ship) { vertical_ship }

    it {expect(subject.place_vertically ship, positionA, positionB).to eq(true)}

    context 'after placing a ship' do
      before :each do
        subject.place_vertically ship, positionA, positionB
      end

      it {expect(subject).to_not be_empty}
      it {expect(ship).to have_received(:vertically!)}
    end
  end
end
