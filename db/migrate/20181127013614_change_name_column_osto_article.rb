class ChangeNameColumnOstoArticle < ActiveRecord::Migration[5.0]
  def change
    rename_column :articles, :OS, :operating_system
  end
end
