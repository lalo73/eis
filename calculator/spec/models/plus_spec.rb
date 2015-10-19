require 'rspec'
require_relative '../../app/models/plus'

describe Plus do
  subject { described_class.new }
  let(:operand1) { 2 }
  let(:operand2) { 4 }

  it 'plus both operands' do
    expect(subject.operate operand1, operand2).to eq(6)
  end
end