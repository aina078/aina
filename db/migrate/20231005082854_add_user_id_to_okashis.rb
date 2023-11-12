class AddUserIdToOkashis < ActiveRecord::Migration[6.1]
  def change
    add_column :okashis, :user_id, :integer
  end
end
