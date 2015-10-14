require 'rspec'
require_relative '../model/board'
require_relative '../model/ship'
require_relative '../model/fire_result'

describe Board do
  subject { described_class.new }

  let(:positionA) { "A" }
  let(:positionB) { "1" }

  let(:vertical_ship) { double("Ship", horizontally?: false, vertically?: true,vertically!: nil, lenght: 3) }
  let(:horizontal_ship) { double("Ship", horizontally?: true,horizontally!: nil, lenght: 3) }

  it { expect(subject).to be_empty }

  describe '#initizlize' do
    context 'default values' do
      it {expect(subject.width).to be(10)}
      it {expect(subject.height).to be(10)}
    end

    context 'passing params' do

      let(:widht) { 20 }
      let(:height) { 20 }

      subject { described_class.new widht, height }

      it {expect(subject.width).to be(widht)}
      it {expect(subject.height).to be(height)}

    end
  end

  describe '#fire_at' do
    context 'with a empty position' do
      it { expect(subject.fire_at positionA, positionB).to an_instance_of(FireResult) }
      it { expect(subject.fire_at positionA, positionB).to be_water }
      it { expect(subject.fire_at positionA, positionB).to_not be_touch }
      it { expect(subject.fire_at positionA, positionB).to_not be_sunk }
    end

    context 'with a ship at A1' do
      before :each do
        allow(vertical_ship).to receive(:touch!).with(0).and_return(FireResult.touch).once
        subject.place_vertically vertical_ship, positionA, positionB
      end
      it { expect(subject.fire_at positionA, positionB).to an_instance_of(FireResult) }
      it { expect(subject.fire_at positionA, positionB).to_not be_water }
      it { expect(subject.fire_at positionA, positionB).to be_touch }
      it { expect(subject.fire_at positionA, positionB).to_not be_sunk }
    end

    context 'with an almost sunk ship at A1' do
      let(:sunk_position) { positionB.to_i + 2}
      before :each do
        allow(vertical_ship).to receive(:touch!).with(0).once
        allow(vertical_ship).to receive(:touch!).with(1).once
        allow(vertical_ship).to receive(:touch!).with(2).and_return(FireResult.sunk).once
        subject.place_vertically vertical_ship, positionA, positionB
        subject.fire_at positionA, positionB
        subject.fire_at positionA, (positionB.to_i + 1)
      end
      it { expect(subject.fire_at positionA, sunk_position).to an_instance_of(FireResult) }
      #it { expect(subject.fire_at positionA, sunk_position).to_not be_water }
      it { expect(subject.fire_at positionA, sunk_position).to_not be_touch }
      #it { expect(subject.fire_at positionA, sunk_position).to be_sunk }
    end

  end

  describe '#valid_positoin?' do
    context 'with default width and height' do
      it {expect(subject).to be_valid_position("A", 1)}
      it {expect(subject).to be_valid_position("J", 10)}
      it {expect(subject).to_not be_valid_position("J", 11)}
      it {expect(subject).to_not be_valid_position("K", 1)}
    end
  end

  describe '#first_left' do
    before :each do
      subject.place_horizontally horizontal_ship, "A", 0
    end
    it {expect(subject.first_left "A", 5).to eq(0)}
    it {expect(subject.first_left "A", 0).to eq(0)}
  end

  describe '#first_above' do
    before :each do
      subject.place_vertically vertical_ship, "A", 0
    end
    it {expect(subject.first_above "J", 0).to eq("A")}
    it {expect(subject.first_above "A", 0).to eq("A")}
  end

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

      context 'trying to put a ship in same position' do
        it {expect(subject.place_horizontally ship, positionA, positionB).to be_falsy}
      end

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

      context 'trying to put a ship in same position' do
        it {expect(subject.place_vertically ship, positionA, positionB).to be_falsy}
      end
    end
  end
end
