class HomeController < ApplicationController
  def index
  	@page = params[:page]
  	if @page == "2"
  		@articlepreferencial = Article.where("priority = 'activo2'")
      @advertisementpreferencial = Advertisement.where("state = 'activo2'")
  	elsif @page == "3"
  		@articlepreferencial = Article.where("priority = 'activo3'")
      @advertisementpreferencial = Advertisement.where("state = 'activo3'")
  	else
  		@articlepreferencial = Article.where("priority = 'activo1'")
      @advertisementpreferencial = Advertisement.where("state = 'activo1'")
  	end
  		
  	@publications = Publication.paginate(page: params[:page],per_page: 10).all.ultimos
  	@publication = Publication.new
  end
  def download_doc
  	send_file "#{Rails.root}/app/assets/files/Contrato de compra y venta de Celular.docx", x_sendfile: true
  end
end
