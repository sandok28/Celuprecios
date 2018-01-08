class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :name
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
