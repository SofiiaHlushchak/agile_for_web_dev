class AddChangePasswordForUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_password_digest, :string
  end
end
