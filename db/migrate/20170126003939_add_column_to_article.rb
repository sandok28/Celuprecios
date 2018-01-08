class AddColumnToArticle < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles, :priority, :string, default: "normal"
  end
end
