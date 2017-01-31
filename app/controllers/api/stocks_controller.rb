class Api::StocksController < ApplicationController
  def index
    @stocks = Stock.where('user_id = ?', params[:user_id])
  end

  def create
    @stock = Stock.new(stock_params)

    if @stock.save
      render :show
    else
      render json: @stock.errors.full_messages
    end
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    render :show
  end

  private

  def stock_params
    params.require(:stock).permit(:user_id, :company_id, :shares)
  end

end
