require 'rails_helper'

RSpec.describe Researcher, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:academic_title) }
    it { is_expected.to validate_presence_of(:institution_affiliation) }
    it { is_expected.to validate_presence_of(:genre) }
    it { is_expected.to validate_presence_of(:image) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:institution) }
  end
end
