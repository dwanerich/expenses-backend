class TransactionsController < ApplicationController

    before_action :set_account

    def index
        @transactions = Transaction.all
        render json: @transactions
    end
    
    def show
        @transaction = Transaction.find(params[:id])
        render json: @transaction
    end

    def create
        @transaction = @account.transactions.new(transaction_params)
        if @account.update_balance(@transaction) != 'Insufficient Funds!'
        @transaction.save
           render json: @transaction
        else
            render json: {error: 'Insufficient Funds!'}
        end
    end


    def destroy
        # @transaction = Transaction.find(params[:id])
        # @transaction.destroy
    end


    private


    def set_account
        @account = Account.find(params[:account_id])
    end

    def transaction_params
        params.require(:transaction).permit(:account_id, :amount, :kind, :date, :description)
    end

end
