class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    
    create_table :advertisements do |t|
      t.string :name
      t.text :body
      t.string :direccion
      t.string :url
      t.string :slogan
      t.string :ciudad
      t.string :state, default: "desactivo"
      t.timestamps
    end
    
  end
end
