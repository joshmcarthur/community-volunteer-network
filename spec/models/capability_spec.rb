require "rails_helper"

RSpec.describe Capability, type: :model do
  subject { FactoryBot.build(:capability) }
  it { is_expected.to be_valid }

  it "has a parent" do
    expect(subject.build_parent).to be_a Capability
  end
end
