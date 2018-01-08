class ChangeDefaultToArticles < ActiveRecord::Migration[5.0]
  def change
  	 change_column :articles, :efectivo, :string
  end
end
