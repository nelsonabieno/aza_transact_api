# Todo list
# create a CalculateAmountService to handle exchange_rate calculations
# check for code duplication to make it DRY
# write unit tests for each functionality
# update read me api documentation
# add security authentication

class TransactionsController < ApplicationController
  before_action :find_transaction, only: [:show ,:update ]

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
    render json: @transaction, status: :ok
  end

  def update

    if @transaction.update(transaction_params)
      render json: @transaction, status: :ok
    else
      render json: { error: @transaction.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.permit(:customer_id, :input_amount, :input_amount_currency, :output_amount_currency, :exchange_rate)
  end

  def find_transaction

    transaction = Transaction.find_by_id(params[:id])

    if transaction.nil?
      render json: {message: "transaction not found"}, status: :not_found
    else
      @transaction = Transaction.find(params[:id])
    end
  end
end
