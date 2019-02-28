class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.text :original_text
      t.text :translated_text
      t.date :review_date

      t.timestamps
    end
  end
end
