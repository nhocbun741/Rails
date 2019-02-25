class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
    t.string :headline
    t.string :sentence
    t.integer :count_like
    t.timestamps
    end
  end
end
