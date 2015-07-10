module SongHelper
  def self.languages(song)
    song.lyrics.pluck(:lang_code).push('new_lang').freeze
  end
end

Soymilk::App.helpers SongHelper
