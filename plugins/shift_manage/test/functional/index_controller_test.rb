require File.expand_path('../../test_helper', __FILE__)

class IndexControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_truth
    get :check_in
    assert_response :success
  end

  def test_create
    post :create
    assert_response :success
  end
end
