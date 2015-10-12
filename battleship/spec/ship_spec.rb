require 'rspec'
require_relative '../model/ship'

describe Ship do
  subject { described_class.new }

  describe "#default_lenght" do
    it {expect(subject.default_lenght).to eq(3)}
  end

  describe "#lenght" do
    it {expect(subject.lenght).to eq(subject.default_lenght)}
  end

  describe '#horizontally?' do
    it {expect(subject).to_not be_horizontally}
    context 'after call #horizontally!' do
      before :each do
        subject.horizontally!
      end

      it { expect(subject).to be_horizontally }

    end
  end

end
