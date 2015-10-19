require 'rspec'
require_relative '../../app/models/operator_factory'

describe OperatorFactory do
  subject { described_class.new }

  it { expect(subject.plus).to be_an_instance_of(Plus) }

  it { expect(subject.subtraction).to be_an_instance_of(Subtraction) }

  it { expect(subject.average).to be_an_instance_of(Average) }
end
