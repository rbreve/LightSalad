require 'test_helper'

class FeatureVotesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => FeatureVotes.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    FeatureVotes.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    FeatureVotes.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to feature_votes_url(assigns(:feature_votes))
  end
  
  def test_edit
    get :edit, :id => FeatureVotes.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    FeatureVotes.any_instance.stubs(:valid?).returns(false)
    put :update, :id => FeatureVotes.first
    assert_template 'edit'
  end
  
  def test_update_valid
    FeatureVotes.any_instance.stubs(:valid?).returns(true)
    put :update, :id => FeatureVotes.first
    assert_redirected_to feature_votes_url(assigns(:feature_votes))
  end
  
  def test_destroy
    feature_votes = FeatureVotes.first
    delete :destroy, :id => feature_votes
    assert_redirected_to feature_votes_url
    assert !FeatureVotes.exists?(feature_votes.id)
  end
end
