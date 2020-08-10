class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year, message: "Title used already.You can only use the title once a year."}
  
  validates :released, inclusion: {in: [true, false]} 
  validates :artist_name, presence: true
  validates :genre, presence: true
  
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end


  def released?
    released
  end
  
  
  
 

end # class end 
