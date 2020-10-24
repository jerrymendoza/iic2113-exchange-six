# Preview all emails at http://localhost:3000/rails/mailers/transaction_mailer
class TransactionMailerPreview < ActionMailer::Preview
    def new_transaction_email
        # Set up a temporary order for the preview
        transaction = Transaction.new(coin_id: 1, account_id: 1, cantidad: 2, valor_clp: 8000.0, tipo: "compra")
        TransactionMailer.with(transaction: transaction).new_transaction_email
    end
end
# {
#     "coin_id": 1,    
#     "account_id": 1, 
#     "cantidad": 2,   
#     "valor_clp": 8000.0,   
#     "tipo": "compra"       
#     }