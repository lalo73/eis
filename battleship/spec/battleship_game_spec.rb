require_relative '../model/battleship_game'
require_relative '../model/ship'

describe BattleshipGame do
  subject { described_class.new }

  describe '#build_desctructor' do
    it { expect(subject.build_destructor).to be_an_instance_of(Ship) }
  end
end
