
    # t.string   "title"
    # t.boolean  "released"
    # t.integer  "release_year"
    # t.string   "artist_name"
    # t.string   "genre"

class Song < ApplicationRecord
     validates :title, presence: true, uniqueness: { scope: :release_year}
     validates :released, inclusion: { in: [true, false] }
     validates :artist_name, presence: true
     validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year, if: :is_released? }

     def is_released?
        released == true ? true : false
     end
end
