class Institution < ApplicationRecord
  belongs_to :city
  has_many :researchers

  validates :name, presence: true
  validates :acronym, presence: true
end
