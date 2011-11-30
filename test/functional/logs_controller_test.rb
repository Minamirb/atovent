require 'test_helper'

class LogsControllerTest < ActionController::TestCase
  setup do
    @log = logs(:one)
    @workshop = @log.workshop
  end

  test "should get index" do
    get :index, workshop_id: @workshop.to_param
    assert_response :success
    assert_not_nil assigns(:logs)
  end

  test "should get new" do
    get :new, workshop_id: @workshop.to_param
    assert_response :success
  end

  test "should create log" do
    assert_difference('Log.count') do
      post :create, workshop_id: @workshop.to_param, log: @log.attributes
    end

    assert_redirected_to workshop_log_path(assigns(:workshop), assigns(:log))
  end

  test "should show log" do
    get :show, workshop_id: @workshop.to_param, id: @log.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, workshop_id: @workshop.to_param, id: @log.to_param
    assert_response :success
  end

  test "should update log" do
    put :update, workshop_id: @workshop.to_param, id: @log.to_param, log: @log.attributes
    assert_redirected_to workshop_log_path(assigns(:workshop), assigns(:log))
  end

  test "should destroy log" do
    assert_difference('Log.count', -1) do
      delete :destroy, workshop_id: @workshop.to_param, id: @log.to_param
    end

    assert_redirected_to workshop_logs_path(assigns(:workshop))
  end
end
