FactoryBot.define do
  factory :account do
    saldo_clp { 1.5 }
    btfs { 1 }
    bths { 1 }
    is_partner { false }
  end
end
