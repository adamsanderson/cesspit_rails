require 'sass-rails'
require_relative './test_helper'

class CesspitRailsTest < ActiveSupport::TestCase
  attr_accessor :cesspit

  setup do
    @cesspit = Cesspit.new
    @cesspit.io = StringIO.new
  end
  
  test "adding assets" do
    cesspit.add_asset "red.css"
    
    assert_equal 1, cesspit.unmatched_selectors.length
    assert_equal [".red"], cesspit.unmatched_selectors
  end
  
  test "adding processed assets" do
    cesspit.add_asset "application.css"

    assert_equal 2, cesspit.unmatched_selectors.length
    assert_equal [".red", ".blue"], cesspit.unmatched_selectors
  end
  
  test "raises when asset is missing" do
    assert_raises CesspitRails::AssetHelpers::AssetNotFound do
      cesspit.add_asset "does_not_exist.css"
    end
  end
  
  test "adding assets by path" do
    cesspit.read_css "application.css"

    assert_equal 2, cesspit.unmatched_selectors.length
    assert_equal [".red", ".blue"], cesspit.unmatched_selectors
  end
  
  test "adding files by path" do
    # Verify that we can still load without going through sprockets
    cesspit.read_css(Rails.root + "app/assets/stylesheets/red.css")

    assert_equal 1, cesspit.unmatched_selectors.length
    assert_equal [".red"], cesspit.unmatched_selectors
  end

end
