class Researcher < ApplicationRecord
  belongs_to :institution, class_name: 'Institution', foreign_key: :institution_affiliation,
                           inverse_of: :researchers

  mount_uploader :image, ProfileImageUploader

  validates :name, presence: true
  validates :title, presence: true
  validates :academic_title, presence: true
  validates :institution_affiliation, presence: true
  validates :genre, presence: true
  validates :image, presence: true
end
