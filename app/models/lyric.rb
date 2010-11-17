class Lyric < ActiveRecord::Base
	belongs_to :song
	validate :language, :presence => true
	validate :body, :presence => true
	validate :song_id
end
