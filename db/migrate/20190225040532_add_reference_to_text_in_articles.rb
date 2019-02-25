class AddReferenceToTextInArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :text, index: true
  end
end
