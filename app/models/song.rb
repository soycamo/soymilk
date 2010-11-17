class Song < ActiveRecord::Base
	validates :name, :presence => true
	validates :artist, :presence => true

	has_many :lyrics
	accepts_nested_attributes_for :lyrics, :allow_destroy => true
end
