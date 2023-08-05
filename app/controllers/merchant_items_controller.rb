class MerchantItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items.all
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @item = @merchant.items.find(params[:id])
    # @item_photo = UnsplashService.new.get_merchant_item_photo(@item.name)
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @item = @merchant.items.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.items.find(params[:id])
    if item.update(item_params)
      if !params[:item][:status].nil?
        redirect_to merchant_items_path(merchant)
      else
        flash[:alert] = "Item information updated successfully!"
        redirect_to merchant_item_path(merchant, item)
      end
    else
      redirect_to  edit_merchant_item_path(merchant, item)
      flash[:alert] = "Error: #{error_message(item.errors)}"
    end
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @item = @merchant.items.new
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.items.new(item_params)
    if item.save
      flash[:success] = "Item created successfully."
      redirect_to merchant_items_path
    else 
      flash[:alert] = "Error: #{error_message(item.errors)}"
      redirect_to new_merchant_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :id, :status) 
  end
end