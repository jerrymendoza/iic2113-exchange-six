FactoryBot.define do
  factory :transaction do
    coin { nil }
    account { nil }
    cantidad { 1 }
    valor_clp { 1.5 }
    tipo { "MyString" }
  end
end
