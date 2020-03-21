require "rails_helper"

RSpec.describe Street, type: :model do
  subject { FactoryBot.build(:street) }
  it { is_expected.to be_valid }
end
