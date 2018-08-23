class AddResetToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :reset_digests, :string
    add_column :users, :reset_sent_at, :datetime
  end
end
