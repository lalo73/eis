RSpec::Matchers.define :beat do |expected|
  match do |actual|
    actual.beats? expected
  end
end

