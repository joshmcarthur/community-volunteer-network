require "rails_helper"

RSpec.describe Feature, type: :model do
  subject { FactoryBot.build(:feature) }
  it { is_expected.to be_valid }

  describe ".on?" do
    let!(:enabled) { FactoryBot.create(:feature) }
    let!(:disabled) { FactoryBot.create(:feature, :disabled) }

    it { expect(Feature.on?(enabled.key)).to eq true }
    it { expect(Feature.on?(disabled.key)).to eq false }
  end

  describe ".demand!" do
    let!(:enabled) { FactoryBot.create(:feature) }
    let!(:disabled) { FactoryBot.create(:feature, :disabled) }

    it { expect(Feature.demand!(enabled.key)).to eq true }
    it { expect { Feature.demand!(disabled.key) }.to raise_error(Feature::DisabledError) }
  end
end
