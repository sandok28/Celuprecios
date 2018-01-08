class AddPhotoAndCoverToAdvertisement < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :advertisements, :photo
    add_attachment :advertisements, :cover
  end
end
