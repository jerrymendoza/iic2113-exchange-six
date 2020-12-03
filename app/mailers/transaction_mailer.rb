class TransactionMailer < ApplicationMailer
    def new_transaction_email
        @transaction = params[:transaction]
        @user = User.where(account: @transaction.account).first
        @coin = Coin.where(id: @transaction.coin_id).first
        mail(to: @user.email, subject: "Nueva transacción con exchange-six!")
    end
end
