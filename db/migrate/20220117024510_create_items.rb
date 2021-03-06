class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.string :image_id
      t.integer :price
      t.boolean :sales_status, default: true

      t.timestamps
    end
  end
end
