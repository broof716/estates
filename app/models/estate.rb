class Estate < ApplicationRecord
  belongs_to :user
  goecoded_by :address
  after_validation :geocode

  validates :address, presence: true
  validates :name, length: { minimum: 3}
end
