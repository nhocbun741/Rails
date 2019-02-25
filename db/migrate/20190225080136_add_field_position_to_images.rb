class AddFieldPositionToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :postion, :integer
  end
end
