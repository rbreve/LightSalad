require 'test_helper'

class LogsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Log.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Log.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Log.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to log_url(assigns(:log))
  end
  
  def test_edit
    get :edit, :id => Log.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Log.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Log.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Log.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Log.first
    assert_redirected_to log_url(assigns(:log))
  end
  
  def test_destroy
    log = Log.first
    delete :destroy, :id => log
    assert_redirected_to logs_url
    assert !Log.exists?(log.id)
  end
end
