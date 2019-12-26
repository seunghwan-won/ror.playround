require 'test_helper'

class Yaffle::Test < ActiveSupport::TestCase
    load_schema

  test "truth" do
    assert_kind_of Module, Yaffle
  end

  class Hickwall < ActiveRecord::Base
  end
 
  class Wickwall < ActiveRecord::Base
  end
 
  def test_schema_has_loaded_correctly
    assert_equal [], Hickwall.all
    assert_equal [], Wickwall.all
  end
 
end
