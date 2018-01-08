class Publication < ApplicationRecord
  belongs_to :user
  belongs_to :article,optional: true
  belongs_to :advertisement,optional: true

  scope :ultimos, ->{ order("created_at DESC")}
end
