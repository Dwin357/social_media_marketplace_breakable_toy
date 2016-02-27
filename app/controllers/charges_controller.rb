class ChargesController < ApplicationController

  def new

  end

  def create
    @amount = 1000 #this is $5, min charge is $0.50

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :Customer    => customer.id,
      :amount      => @amount,
      :description => "",
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  redirect_to secret_path
end
