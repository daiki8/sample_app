class RenameResetDigestsColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :reset_digests, :reset_digest
  end
end
