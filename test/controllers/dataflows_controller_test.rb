require 'test_helper'

class DataflowsControllerTest < ActionController::TestCase
  setup do
    @dataflow = dataflows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataflows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataflow" do
    assert_difference('Dataflow.count') do
      post :create, dataflow: { dataset_id: @dataflow.dataset_id, interface_id: @dataflow.interface_id }
    end

    assert_redirected_to dataflow_path(assigns(:dataflow))
  end

  test "should show dataflow" do
    get :show, id: @dataflow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dataflow
    assert_response :success
  end

  test "should update dataflow" do
    patch :update, id: @dataflow, dataflow: { dataset_id: @dataflow.dataset_id, interface_id: @dataflow.interface_id }
    assert_redirected_to dataflow_path(assigns(:dataflow))
  end

  test "should destroy dataflow" do
    assert_difference('Dataflow.count', -1) do
      delete :destroy, id: @dataflow
    end

    assert_redirected_to dataflows_path
  end
end
