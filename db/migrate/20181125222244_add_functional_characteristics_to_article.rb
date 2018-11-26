class AddFunctionalCharacteristicsToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :OS, :string
    add_column :articles, :screen_size, :string
    add_column :articles, :front_camera, :string
    add_column :articles, :back_camera, :string
    add_column :articles, :ram, :string
    add_column :articles, :internal_storage, :string
  end
end
