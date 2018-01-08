class AddColumnsPhotosToArticle < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :articles, :foto1
  	add_attachment :articles, :foto2
  	add_attachment :articles, :foto3
  	add_attachment :articles, :foto4
  end
end
