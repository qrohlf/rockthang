require 'test_helper'

class PitchesControllerTest < ActionController::TestCase
  setup do
    load "#{Rails.root}/db/seeds.rb"
    @pitch = Pitch.first
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:pitches)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create pitch" do
  #   assert_difference('Pitch.count') do
  #     post :create, pitch: { difficulty: @pitch.difficulty }
  #   end

  #   assert_redirected_to pitch_path(assigns(:pitch))
  # end

  test "should show pitch" do
    get :show, id: @pitch
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @pitch
  #   assert_response :success
  # end

  # test "should update pitch" do
  #   patch :update, id: @pitch, pitch: { difficulty: @pitch.difficulty }
  #   assert_redirected_to pitch_path(assigns(:pitch))
  # end

  test "should destroy pitch" do
    climb_path = climb_url @pitch.climb
    assert_difference('Pitch.count', -1) do
      delete :destroy, id: @pitch
    end

    assert_redirected_to climb_path
  end
end
