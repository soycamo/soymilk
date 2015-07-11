require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')
require 'pry'

class AdminSongTest < AdminAcceptanceSpec
  @email, @password = 'foo@bar.com', 'password'
  before do
    Account.create(email: @email, password: @password, password_confirmation: @password, role: 'admin')
  end
  it "song index, no songs" do
    #assert_equal(Song.count, 0)
    binding.pry
    login @email, @password
    visit "/admin/songs"
    #save_and_open_page
    assert page.has_content?("Add new song")
  end
  #def teardown
  #  Account.destroy_all
  #end
end

def login(email, password)
  visit "/login"
  fill_in :email, with: email
  fill_in :password, with: password
  click_button "Sign In"
end
