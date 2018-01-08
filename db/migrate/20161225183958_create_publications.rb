class CreatePublications < ActiveRecord::Migration[5.0]
  def change
  	
    create_table :publications do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.references :advertisement, foreign_key: true
      t.text :body 
      t.timestamps
    end
  end
end
