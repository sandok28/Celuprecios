class AddColumnPhoneToAdvertisements < ActiveRecord::Migration[5.0]
  def change
  	add_column :advertisements, :phone, :string, default: 0
  end
end
