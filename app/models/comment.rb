class Comment < ApplicationRecord
  belongs_to :user
  scope :comprador, ->{ where(tipo: "comprador") }
  scope :vendedor, ->{ where(tipo: "vendedor") }
  scope :likes, ->{ where(like: "like") }
  scope :ultimos, ->{ order("created_at DESC")}
end
