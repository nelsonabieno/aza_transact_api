class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    render json: @transactions, status: :ok
  end

  def create
    transaction = Transaction.new(transaction_params)
    output_amount = params[:input_amount].to_f * params[:exchange_rate].to_f
    transaction.output_amount = output_amount

    if transaction.save
      render json: { message: 'transaction record successfully created' }, status: :created
    else
      render json: {
        error: transaction.errors.full_messages,
        message:  'error saving transaction record'
      }, status: :unprocessable_entity
    end
  end

  def show
    transaction = Transaction.find(params[:id])
    render json: transaction, status: :ok
  end

  private

  def transaction_params
    params.permit(:customer_id, :input_amount, :input_amount_currency, :output_amount_currency, :exchange_rate)
  end
end
