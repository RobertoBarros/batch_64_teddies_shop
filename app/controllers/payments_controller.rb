class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
    @amount_centavos = @order.amount_centavos
    card_hash = params[:card_hash]

    transaction = PagarMe::Transaction.new( amount: @amount_centavos, card_hash: card_hash).charge


    if transaction.status == 'paid'
      @order.update(pagarme_id: transaction.id, state: 'paid')
      redirect_to order_path(@order)
    else
      flash[:alert] = 'Não Foi possível cobrar esse cartão'
      redirect_to new_order_payment_path(@order)
    end
  end


  private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end


end
