class BulkDiscountsController < ApplicationController

  def index 
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.bulk_discounts.all
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @discount = @merchant.bulk_discounts.find(params[:id])
  end
  
  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @discount = @merchant.bulk_discounts.find(params[:id])
  end
  
  def update
    merchant = Merchant.find(params[:merchant_id])
    discount = merchant.bulk_discounts.find(params[:id])
    if discount.update(bulk_discounts_params)
      redirect_to merchant_bulk_discount_path(merchant, discount)
      flash[:alert] = "Discount information updated successfully!"
    else
      redirect_to edit_merchant_bulk_discount_path(merchant, discount)
      flash[:alert] = "Error: #{error_message(discount.errors)}"
    end
  end
  
  def new
    @merchant = Merchant.find(params[:merchant_id])
    @discount = @merchant.bulk_discounts.new
  end
  
  def create
    merchant = Merchant.find(params[:merchant_id])
    discount = merchant.bulk_discounts.new(bulk_discounts_params)
    if discount.save
      flash[:success] = "Bulk Discount created successfully."
      redirect_to merchant_bulk_discounts_path(merchant)
    else 
      flash[:alert] = "Error: #{error_message(discount.errors)}"
      redirect_to new_merchant_bulk_discount_path(merchant)
    end
  end
  
  def destroy
    merchant = Merchant.find(params[:merchant_id])
    discount = merchant.bulk_discounts.find(params[:id]).destroy
    redirect_to merchant_bulk_discounts_path(merchant)
  end
  
  
  private
  
  def bulk_discounts_params
    params.permit(:quantity, :percentage, :id, :merchant_id) 
  end
end