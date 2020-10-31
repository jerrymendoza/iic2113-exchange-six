class AddForeignKeyOnDoorkeeper < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :oauth_access_grants, :oauth_applications, column: :application_id, validate: false
    add_foreign_key :oauth_access_tokens, :oauth_applications, column: :application_id, validate: false
    add_foreign_key :oauth_access_grants, :users, column: :resource_owner_id, validate: false
    add_foreign_key :oauth_access_tokens, :users, column: :resource_owner_id, validate: false
    
  end
end