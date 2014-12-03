require 'test_helper'

class InvoiceInvoiceDetailsControllerTest < ActionController::TestCase
  setup do
    @invoice_invoice_detail = invoice_invoice_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_invoice_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice_invoice_detail" do
    assert_difference('InvoiceInvoiceDetail.count') do
      post :create, invoice_invoice_detail: { remarks: @invoice_invoice_detail.remarks }
    end

    assert_redirected_to invoice_invoice_detail_path(assigns(:invoice_invoice_detail))
  end

  test "should show invoice_invoice_detail" do
    get :show, id: @invoice_invoice_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice_invoice_detail
    assert_response :success
  end

  test "should update invoice_invoice_detail" do
    put :update, id: @invoice_invoice_detail, invoice_invoice_detail: { remarks: @invoice_invoice_detail.remarks }
    assert_redirected_to invoice_invoice_detail_path(assigns(:invoice_invoice_detail))
  end

  test "should destroy invoice_invoice_detail" do
    assert_difference('InvoiceInvoiceDetail.count', -1) do
      delete :destroy, id: @invoice_invoice_detail
    end

    assert_redirected_to invoice_invoice_details_path
  end
end
