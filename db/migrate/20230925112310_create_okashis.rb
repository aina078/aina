class CreateOkashis < ActiveRecord::Migration[6.1]
  def change
    create_table :okashis do |t|
      t.string :name
      t.string :genre
      t.text :kansou
      t.integer :item
      t.string :place
      t.string :company

      t.timestamps
    end
  end
end
