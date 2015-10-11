require 'rspec'
require_relative '../model/ship'

describe Ship do
  subject { described_class.new }

  it {expect(subject.default_lenght).to eq(3)}

  it {expect(subject.lenght).to eq(subject.default_lenght)}
end