require "rails_helper"

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }
  it { is_expected.to be_valid }

  it "has capabilities" do
    expect(subject.capabilities).to eq []
  end
end
