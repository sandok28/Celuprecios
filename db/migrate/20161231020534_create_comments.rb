class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.integer :comentador
      t.string :like
      t.text :body
      t.string :tipo

      t.timestamps
    end
  end
end
