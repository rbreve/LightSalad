require File.dirname(__FILE__) + '/../test_helper'
require 'salad_controller'

# Re-raise errors caught by the controller.
class SaladController; def rescue_action(e) raise e end; end

class SaladControllerTest < Test::Unit::TestCase
  def setup
    @controller = SaladController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
