class AddReferenceToImageInArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :image, index: true
  end
end
