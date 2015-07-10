require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')
require 'pry'

class TestSong < Minitest::Test
  def setup
    @song = Song.create
    @song.lyrics.build(canonical: true, lang_code: 'spa')
  end
  def teardown
    @song.lyrics.destroy_all
    @song.destroy
  end


  def test_no_translations
    assert_equal(@song.translations.count, 0)
  end
  def test_one_translations
    @song.lyrics.create(canonical: false)
    assert_equal(@song.translations.count, 1)
  end

  def test_canonical_languages
    @song.save
    assert_includes(@song.canonical_languages, 'spa')
  end
end
