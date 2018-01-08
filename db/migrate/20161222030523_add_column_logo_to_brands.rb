class AddColumnLogoToBrands < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :brands, :logo
  end
end
