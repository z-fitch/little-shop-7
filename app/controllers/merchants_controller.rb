class MerchantsController < ApplicationController


  def show 
    @merchant = Merchant.find(params[:merchant_id])
    # @merchant_photo = UnsplashService.new.get_random_photo
  end
end