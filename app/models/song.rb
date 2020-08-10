class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates_uniqueness_of :title, { scope: [ :artist, :year ] }
  validates :released, inclusion: { in: [ true, false ], message: 'Must be true or false.' }
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  validates :release_year, presence: true, if: :released?

end
