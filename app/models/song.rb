class Song < ActiveRecord::Base
	validates :name, :presence => true
	validates :artist, :presence => true

	has_many :lyrics
end
