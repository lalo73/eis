require 'rspec'
require_relative '../../app/models/subtraction'

describe Subtraction do
  subject { described_class.new }
  let(:operand1) { 2 }
  let(:operand2) { 4 }

  it 'plus both operands' do
    expect(subject.operate operand1, operand2).to eq(-2)
  end
end
