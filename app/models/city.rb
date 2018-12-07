class City < ApplicationRecord

  validates :name, presence: { message:  ": No tiene nombre" }, uniqueness: { message:  ": Ciudad ya existe", case_sensitive: false }

  has_many :articles
end
