class ArticlesController < ApplicationController
  before_action :authenticate_normal_user!, except: [:show,:photo]

  def index
    @articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
    @question = Question.new
    @questions = @article.questions
    @cont = 0
    if !@article.foto1_file_name.nil?
      @cont += 1
    end
    if !@article.foto2_file_name.nil?
      @cont += 1
    end
    if !@article.foto3_file_name.nil?
      @cont += 1
    end
    if !@article.foto4_file_name.nil?
      @cont += 1
    end

    @calificaciones = [
      ["Malo","Malo","Malo","Regular","Regular","Regular","Bueno","Bueno","Excelente","Excelente"],
      ["Malo","Malo","Malo","Regular","Regular","Regular","Bueno","Bueno","Excelente","Excelente"]
    ]

  end

  def new
  	@article = Article.new
    @calificaciones = [
      ["Malo","Malo","Malo","Regular","Regular","Regular","Bueno","Bueno","Excelente","Excelente"],
      ["Malo","Malo","Malo","Regular","Regular","Regular","Bueno","Bueno","Excelente","Excelente"]
    ]
  end
  
  def create
    @article = current_user.articles.new(article_params)
    
    if @article.save 
      @publication = current_user.publications.new(:article_id => @article.id)
      if @publication.save
        redirect_to @article
      else
      render :new
      end
    else
      @calificaciones = [
        ["Malo","Malo","Malo","Regular","Regular","Regular","Bueno","Bueno","Excelente","Excelente"],
        ["Malo","Malo","Malo","Regular","Regular","Regular","Bueno","Bueno","Excelente","Excelente"]
      ]
      render :new
    end
  end

  def edit
    redirect_to root_path unless current_user.id == Article.find(params[:id]).user.id || current_user.is_admin_user?
    @article = Article.find(params[:id])
    
  end

  def update
    reset_check_box
    @article = Article.find(params[:id])
    if  @article.update(article_params)
      redirect_to  @article
    else
      render :edit
    end
  end
  def destroy
    @publication = Publication.find_by(article_id: params[:id])
    Publication.destroy(@publication.id)
    if Article.destroy(params[:id])
      redirect_to articles_path
    end 
  end
  def photo
    @article = Article.find(params[:article])
    if params[:id] == "1"
      @photo = @article.foto1.url(:original)
    elsif params[:id] == "2"
      @photo = @article.foto2.url(:original)
    elsif params[:id] == "3"
      @photo = @article.foto3.url(:original)
    elsif params[:id] == "4"
      @photo = @article.foto4.url(:original)
    end
  end
  

  private

  def article_params
    if user_signed_in? 
      if current_user.is_admin_user?
        params.require(:article).permit(:vendido,
                                        :brand_id,
                                        :phone_id,
                                        :precio,
                                        :precio_minimo,
                                        :estado_fisico,
                                        :estado_funcional,
                                        :caja,
                                        :garantia,
                                        :factura,
                                        :audifonos,
                                        :cargador,
                                        :vidriotemplado,
                                        :funda,
                                        :cambio,
                                        :efectivo,
                                        :comentario,
                                        :foto1,
                                        :foto2,
                                        :foto3,
                                        :foto4,
                                        :priority,
                                        :celular,
                                        :operating_system,
                                        :screen_size,
                                        :front_camera,
                                        :back_camera,
                                        :ram,
                                        :internal_storage,
                                        :city_id)
      else
       params.require(:article).permit(:vendido,
                                       :brand_id,
                                       :phone_id,
                                       :precio,
                                       :precio_minimo,
                                       :estado_fisico,
                                       :estado_funcional,
                                       :caja,
                                       :garantia,
                                       :factura,
                                       :audifonos,
                                       :cargador,
                                       :vidriotemplado,
                                       :funda,
                                       :cambio,
                                       :efectivo,
                                       :comentario,
                                       :foto1,
                                       :foto2,
                                       :foto3,
                                       :foto4,
                                       :celular,
                                       :operating_system,
                                       :screen_size,
                                       :front_camera,
                                       :back_camera,
                                       :ram,
                                       :internal_storage,
                                       :city_id)
      end
    end
    
  end
  def reset_priority
    article = Article.find(params[:id])
    
    if article.may_desactivar1?
      article.desactivar1!
    end
    if article.may_desactivar2?
      article.desactivar2!
    end
    if article.may_desactivar3?
      article.desactivar3!
    end
    if article.may_inavilitar1?
      article.inavilitar1!
    end
    if article.may_inavilitar2?
      article.inavilitar2!
    end
    if article.may_inavilitar3?
      article.inavilitar3!
    end
    if article.may_inavilitardesactivo?
      article.inavilitardesactivo!
    end
  end

  def reset_check_box 
    article = Article.find(params[:id])
    
    if article.may_nocaja?
      article.nocaja!
    end
    if article.may_nogarantia?
      article.nogarantia!
    end
    if article.may_nofactura?
      article.nofactura!
    end
    if article.may_noaudifonos?
      article.noaudifonos!
    end
    if article.may_nocargador?
      article.nocargador!
    end
    if article.may_nofactura?
      article.nofactura!
    end
    if article.may_nocambio?
      article.nocambio!
    end
    if article.may_noefectivo?
      article.noefectivo!
    end
    if article.may_novidriotemplado?
      article.novidriotemplado!
    end
    if article.may_nofunda?
      article.nofunda!
    end
    if article.may_novendido?
      article.novendido!
    end
  end

end
