class ChangePayTypeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :pay_type, :string, default: 'Check'
  end
end
