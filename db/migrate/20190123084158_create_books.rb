class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :price
      t.string :publisher
      t.text :memo

      t.timestamps
    end
  end
end
