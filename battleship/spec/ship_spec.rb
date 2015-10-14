require 'rspec'
require_relative '../model/ship'

describe Ship do
  subject { described_class.new }

  describe '#default_lenght' do
    it { expect(subject.default_lenght).to eq(3) }
  end

  describe '#lenght' do
    it { expect(subject.lenght).to eq(subject.default_lenght) }
  end

  describe '#horizontally?' do
    it { expect(subject).to_not be_horizontally }
    context 'after call #horizontally!' do
      before :each do
        subject.horizontally!
      end

      it { expect(subject).to be_horizontally }
    end
  end

  describe '#vertically?' do
    it { expect(subject).to_not be_vertically }
    context 'after call #vertically!' do
      before :each do
        subject.vertically!
      end

      it { expect(subject).to be_vertically }
    end
  end

  describe '#touch!' do
    it { expect(subject.touch! 0).to be_touch }
    describe 'last touch' do
      let(:last_position) { subject.lenght - 1 }
      before :each do
        (0...last_position).each { |n| subject.touch! n }
      end

      it { expect(subject.touch! (last_position)).to be_sunk }
    end
  end
end
