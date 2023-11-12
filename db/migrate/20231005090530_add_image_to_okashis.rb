class AddImageToOkashis < ActiveRecord::Migration[6.1]
  def change
    add_column :okashis, :image, :string
  end
end
