require_relative '../model/fire_result'

describe FireResult do
  describe '#water' do
    subject { described_class.water }

    it { expect(subject).to be_water }
    it { expect(subject).to_not be_touch }
    it { expect(subject).to_not be_sunk }
  end

  describe '#touch' do
    subject { described_class.touch }

    it { expect(subject).to_not be_water }
    it { expect(subject).to be_touch }
    it { expect(subject).to_not be_sunk }
  end

  describe '#sunk' do
    subject { described_class.sunk }

    it { expect(subject).to_not be_water }
    it { expect(subject).to_not be_touch }
    it { expect(subject).to be_sunk }
  end
end
