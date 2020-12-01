class AddLastReviewToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_review, :datetime, default: DateTime.new(1900,1,1,1,1,1)
  end
end
