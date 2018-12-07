class Article < ApplicationRecord
  
  include AASM

  has_attached_file   :foto1,
                      :default_url => '/assets/no-image.png',
                      :url => ":s3_domain_url",
                      :styles => { :normal => ["560x560>",:jpg], :mini => ["429x429>",:jpg],:peque => ["130x130>",:jpg]},
                      :default_style => :meddium,
                      :storage => :s3,
                      :path => "upload/Article/foto1/:file_id/:style/:filename"
  validates_attachment_content_type :foto1, content_type: /\Aimage\/.*\z/
  validates :foto1, attachment_presence: { message:  ": La primera foto es obligatoria"}

  has_attached_file   :foto2,
                      :default_url => '/assets/no-image.png',
                      :url => ":s3_domain_url",
                      :styles => { :normal => ["560x560>",:jpg], :mini => ["429x429>",:jpg],:peque => ["130x130>",:jpg]},
                      :default_style => :meddium,
                      :storage => :s3,
                      :path => "upload/Article/foto2/:file_id/:style/:filename"
  validates_attachment_content_type :foto2, content_type: /\Aimage\/.*\z/

  has_attached_file   :foto3,
                      :default_url => '/assets/no-image.png',
                      :url => ":s3_domain_url",
                      :styles => { :normal => ["560x560>",:jpg], :mini => ["429x429>",:jpg],:peque => ["130x130>",:jpg]},
                      :default_style => :meddium,
                      :storage => :s3,
                      :path => "upload/Article/foto3/:file_id/:style/:filename"
  validates_attachment_content_type :foto3, content_type: /\Aimage\/.*\z/

  has_attached_file   :foto4,
                      :default_url => '/assets/no-image.png',
                      :url => ":s3_domain_url",
                      :styles => { :normal => ["560x560>",:jpg], :mini => ["429x429>",:jpg],:peque => ["130x130>",:jpg]},
                      :default_style => :meddium,
                      :storage => :s3,
                      :path => "upload/Article/foto4/:file_id/:style/:filename"
  validates_attachment_content_type :foto4, content_type: /\Aimage\/.*\z/



  
  belongs_to :phone
  belongs_to :user
  belongs_to :brand
  belongs_to :city
  has_many :publications
  has_many :questions
  
  #scope :publicados, ->{ where(state: "published") }
  scope :vendidos, ->{ where(vendido: "si") }
  #scope :ultimos, ->{ order("created_at DESC")}
  validates :caracteristicas, length: { maximum: 280, message:  ": Maximo 280 caracteres" }
  validates :comentario, length: { maximum: 280, message:  ": Maximo 280 caracteres" }
  validates :precio, presence: { message:  ": Precio no especficado"}
  validates :precio_minimo, presence: { message:  ": Precio minimo no especficado"}
  validates :estado_fisico, presence: { message:  ": Estado fisico no especficado"}
  validates :estado_funcional, presence: { message:  ": Estado funcional no especficado"}
  validates :comentario, presence: { message:  ": Comentario no especficado si no tienes, agrega simplemente 'Sin comentarios'"}
  validates :celular, presence: { message:  ": Telefono no especficado si no tienes, agrega simplemente 'No tengo telefono'"}
  #validates :caracteristicas, presence: { message:  ": Caracteristicas del telefono no especficados"} // se agregaron un poco de campos por este
  validates :brand_id, presence: { message:  ": Especifica una marca"}
  validates :phone_id, presence: { message:  ": Especifica un telefono"}
  validates :city_id, presence: { message:  ": Especifica una ciudad"}


  aasm(:priority) do
    state :normal, :initial => true
    state :activo1
    state :activo2
    state :activo3
    state :inavilitado
    event :activar1 do
       transitions :from => :normal, :to => :activo1
    end
    event :activar2 do
       transitions :from => :normal, :to => :activo2
    end
    event :activar3 do
       transitions :from => :normal, :to => :activo3
    end
    event :desactivar1 do
      transitions :from => :activo1, :to => :normal
    end
    event :desactivar2 do
      transitions :from => :activo2, :to => :normal
    end
    event :desactivar3 do
      transitions :from => :activo3, :to => :normal
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
      transitions :from => :normal, :to => :inavilitado
    end
  end

  aasm(:cambio) do
  	state :no, :initial => true
  	state :si
  	event :sicambio do
  		transitions :from => :no, :to => :si
  	end
  	event :nocambio do
  		transitions :from => :si, :to => :no
  	end
  end
  aasm(:caja) do
  	state :no, :initial => true
  	state :si
  	event :sicaja do
  		transitions :from => :no, :to => :si
  	end
  	event :nocaja do
  		transitions from: :si, to: :no
  	end
  end
  aasm(:garantia) do
  	state :no, :initial => true
  	state :si
  	event :sigarantia do
  		transitions :from => :no, :to => :si
  	end
  	event :nogarantia do
  		transitions from: :si, to: :no
  	end
  end 
  aasm(:factura) do
  	state :no, :initial => true
  	state :si
  	event :sifactura do
  		transitions :from => :no, :to => :si
  	end
  	event :nofactura do
  		transitions from: :si, to: :no
  	end
  end
  aasm(:audifonos) do
  	state :no, :initial => true
  	state :si
  	event :siaudifonos do
  		transitions :from => :no, :to => :si
  	end
  	event :noaudifonos do
  		transitions from: :si, to: :no
  	end
  end
  aasm(:cargador) do
  	state :no, :initial => true
  	state :si
  	event :sicargador do
  		transitions :from => :no, :to => :si
  	end
  	event :nocargador do
  		transitions from: :si, to: :no
  	end
  end
  
  aasm(:efectivo) do
  	state :no, :initial => true
  	state :si
  	event :siefectivo do
  		transitions :from => :no, :to => :si
  	end
  	event :noefectivo do
  		transitions from: :si, to: :no
  	end
  end
  aasm(:vidriotemplado) do
  	state :no, :initial => true
  	state :si
  	event :sividriotemplado do
  		transitions :from => :no, :to => :si
  	end
  	event :novidriotemplado do
  		transitions from: :si, to: :no
  	end
  end
  aasm(:funda) do
  	state :no, :initial => true
  	state :si
  	event :sifunda do
  		transitions :from => :no, :to => :si
  	end
  	event :nofunda do
  		transitions from: :si, to: :no
  	end
  end
  aasm(:vendido) do
  	state :no, :initial => true
  	state :si
  	event :sivendido do
  		transitions :from => :no, :to => :si
  	end
  	event :novendido do
  		transitions from: :si, to: :no
  	end
  end

end
