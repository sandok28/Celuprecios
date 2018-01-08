class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file   :photo,
                      :default_url => '/assets/no-image.png',
                      :url => ":s3_domain_url",
                      :styles => { :normal => ["200x200!",:jpg], :mini => ["30x30!",:jpg]},
                      :default_style => :meddium,
                      :storage => :s3,
                      :path => "upload/User/photo/:file_id/:style/:filename"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_many :articles
  has_many :publications
  has_many :comments
  has_many :questions
  include PermissionsConcern
end
