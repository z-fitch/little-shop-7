class Admin::MerchantsController < ApplicationController
  before_action :set_merchant, only: [:update]
  
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:id])    
  end
  
  def update
    if @merchant.update(merchant_params)
      redirect_to admin_merchant_path, flash: { success: "Merchant information updated successfully." }
    else
      render :edit_name
    end
  end

  private

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def merchant_params
    params.require(:merchant).permit(:name) 
  end
end
