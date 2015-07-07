class Song < ActiveRecord::Base
  has_many :lyrics
  accepts_nested_attributes_for :lyrics

  def translations
    self.lyrics.where(canonical: false)
  end
end
