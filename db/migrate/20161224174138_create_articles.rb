class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :phone, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :precio, default: 0
      t.integer :precio_minimo, default: 0
      t.integer :estado_fisico, default: 0
      t.integer :estado_funcional, default: 0
      t.string :cambio, default: "no"
      t.string :caja, default: "no"
      t.string :garantia, default: "no"
      t.string :factura, default: "no"
      t.string :audifonos, default: "no"
      t.string :cargador, default: "no"
      t.string :efectivo, default: "si"
      t.string :trueque, default: "no"
      t.string :ciudad
      t.string :vidriotemplado, default: "no"
      t.string :funda, default: "no"
      t.string :vendido, default: "no"
      t.text :comentario
      t.text :caracteristicas
      
      t.timestamps
    end
  end
end
