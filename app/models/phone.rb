class Phone < ApplicationRecord
  belongs_to :brand
  has_many :articles

  validates :name, presence: { message:  ": No tiene nombre" }, uniqueness: { message:  ": Telefono ya existe", case_sensitive: false }
  validates :brand_id, presence: { message:  ": Selecciona marca" }
end
