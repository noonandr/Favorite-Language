require 'test/unit'
require_relative 'favorite_language_class'

class TestFavourite < Test::Unit::TestCase


  def setup
    @teenager = ::Favourite.new
  end

  def test_stating_something
    assert_equal 'Ruby', @teenager.try_name('noonandr')
    # .get_json('noonandr').find_name(json, name).try_again('n')
  end
  
  def test_bad_name
    assert_equal 'a does not appear to be a valid GitHub user name.', @teenager.try_name('a')
    # .get_json('noonandr').find_name(json, name).try_again('n')
  end
  
end

