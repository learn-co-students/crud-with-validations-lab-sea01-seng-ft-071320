class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates_uniqueness_of :title, { scope: [ :artist_name, :release_year ] }
  validates :released, inclusion: { in: [ true, false ], message: 'Must be true or false.' }

  with_options if: :released? do
    validates :release_year, presence: true
    validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  end

end
