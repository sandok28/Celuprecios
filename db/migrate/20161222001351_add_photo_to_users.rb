class AddPhotoToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :users, :photo
  end
end
