class Advertisement < ApplicationRecord
	include AASM
	has_attached_file   :photo,
                        :default_url => '/assets/no-image.png',
                        :url => ":s3_domain_url",
                        :styles => { :normal => ["161x205>",:jpg], :mini => ["30x30!",:jpg]},
                        :default_style => :meddium,
                        :storage => :s3,
                        :path => "upload/Advertisement/photo/:file_id/:style/:filename"
  	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

    has_attached_file   :cover,
                        :default_url => '/assets/no-image.png',
                        :url => ":s3_domain_url",
                        :styles => { normal: "500x500>", mini: "130x130>"},
                        :default_style => :meddium,
                        :storage => :s3,
                        :path => "upload/Advertisement/cover/:file_id/:style/:filename"
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

	
	has_many :publications

	aasm(:state) do
		state :desactivo, :initial => true
		state :activo1
		state :activo2
		state :activo3
		state :inavilitado
		event :activar1 do
			 transitions :from => :desactivo, :to => :activo1
		end
		event :activar2 do
			 transitions :from => :desactivo, :to => :activo2
		end
		event :activar3 do
			 transitions :from => :desactivo, :to => :activo3
		end
		event :desactivar1 do
			transitions :from => :activo1, :to => :desactivo
		end
		event :desactivar2 do
			transitions :from => :activo2, :to => :desactivo
		end
		event :desactivar3 do
			transitions :from => :activo3, :to => :desactivo
		end
		event :inavilitar1 do
			transitions :from => :activo1, :to => :inavilitado
		end
		event :inavilitar2 do
			transitions :from => :activo2, :to => :inavilitado
		end
		event :inavilitar3 do
			transitions :from => :activo3, :to => :inavilitado
		end
		event :inavilitardesactivo do
			transitions :from => :desactivo, :to => :inavilitado
		end
	end
end
