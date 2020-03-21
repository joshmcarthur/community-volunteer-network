require "rails_helper"

RSpec.describe Community, type: :model do
  subject { FactoryBot.build(:community) }
  it { is_expected.to be_valid }
end
