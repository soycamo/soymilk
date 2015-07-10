class Song < ActiveRecord::Base
  has_many :lyrics
  accepts_nested_attributes_for :lyrics

  def translations
    self.lyrics.where(canonical: false)
  end
  def canonical_languages
    self.lyrics.where(canonical: true).pluck(:lang_code)
  end
  def title
    self.lyrics.where(canonical: true).pluck(:title_in_language).join(" / ")
  end
end
