class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :account

  before_create :create_account

  def get_transactions
    token = bank_token
    current_date = DateTime.now
    uri = "#{ENV['URI_CONST']}/?api_token=#{token}"\
          "&from=#{last_review}&to=#{current_date}"
    query = HTTParty.get(uri, { format: :json })
    if query.code == 200
      update(last_review: current_date)
      return JSON.parse(query.body)
    end
    []
  end

  def update_balance
    bank_accounts = ENV['ACCOUNTS']
    response = get_transactions
    response.each do |transaction|
      if (bank_accounts.include? transaction['account_number']) &&
          (transaction['transaction_type'] == 'transfer')
        current_balance = account.saldo_clp + transaction['amount']
        account.update(saldo_clp: current_balance)
      end
    end
    response
  end

  private
  def create_account
    account = Account.create({
      saldo_clp: 0,
      btfs: rand(100),
      bths: rand(100),
      is_partner: false
    })
    self.account = account
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  bank_token             :string
#  last_review            :datetime         default(Mon, 01 Jan 1900 01:01:01 UTC +00:00)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
