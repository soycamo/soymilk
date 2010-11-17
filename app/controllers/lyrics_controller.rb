class LyricsController < ApplicationController
	before_filter :authenticate, :only => [:create, :destroy]
	def create
    @song = Song.find(params[:song_id])
    @lyric = @song.lyrics.create(params[:lyric])
    redirect_to song_path(@song)
  end

	def destroy
    @song = Song.find(params[:song_id])
    @lyric = @song.lyrics.create(params[:lyric])
		@lyric.destroy
    redirect_to song_path(@song)
	end
end
