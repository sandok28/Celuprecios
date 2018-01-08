class Brand < ApplicationRecord

	has_attached_file   :logo,
                        :default_url => '/assets/no-image.png',
                        :url => ":s3_domain_url",
                        :styles => { :normal => ["200x200>",:jpg], :mini => ["75x75>",:jpg]},
                        :default_style => :meddium,
                        :storage => :s3,
                        :path => "upload/Brand/logo/:file_id/:style/:filename"
	
  	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

    validates :name, presence: { message:  ": No tiene nombre" }, uniqueness: { message:  ": Marca ya existe", case_sensitive: false }
    
  	has_many :phones
  	has_many :articles
end
