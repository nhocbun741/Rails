class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :headline
      t.string :url_image
      t.integer :count_like
    end
  end
end
