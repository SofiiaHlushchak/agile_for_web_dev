class CreatePayTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :pay_types do |t|
      t.string :title
      t.integer :value, default: 0
      t.timestamps
    end
  end
end
