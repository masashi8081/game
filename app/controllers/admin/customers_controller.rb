class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.page(params[:page])
    @customers_all = Customer.all

  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    flash[:notice] = "会員情報を変更しました。"
    redirect_to admin_customer_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :is_deleted)
  end
end
