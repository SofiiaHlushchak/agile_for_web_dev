class AddColumnPriceToLineItem < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :product_price, :decimal , default: 0.01
  end
end
