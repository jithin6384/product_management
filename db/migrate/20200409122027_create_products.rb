class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :product_descprition
      t.string :brand_name

      t.timestamps
    end
  end
end
