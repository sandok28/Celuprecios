class ChangeTypeCityToArticle < ActiveRecord::Migration[5.0]
  def change
    change_column :articles, :ciudad, :integer
  end
end
