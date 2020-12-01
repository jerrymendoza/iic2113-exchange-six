class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :account

  before_create :create_account

  def update_transactions
    token = self.bank_token
    uri="https://bankeleven.herokuapp.com/api/v1/transactions/?api_token=#{token}"
    response = HTTParty.get(uri,
      {format: :json})
    puts response.body
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
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
