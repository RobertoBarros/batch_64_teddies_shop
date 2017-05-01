class OrdersController < ApplicationController

  def create
    @teddy = Teddy.find(params[:teddy_id])
    order  = Order.create!(teddy_sku: @teddy.sku, amount: @teddy.price, state: 'pending')

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

end
