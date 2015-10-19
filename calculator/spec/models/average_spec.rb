require 'rspec'
require_relative '../../app/models/average'

describe Average do
  subject { described_class.new }
  let(:operand1) { 2 }
  let(:operand2) { 4 }

  it 'calculate the average of operands' do
    expect(subject.operate operand1, operand2).to eq(3)
  end
end
