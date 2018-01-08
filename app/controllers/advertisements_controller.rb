class AdvertisementsController < ApplicationController
  before_action :authenticate_admin_user!, except: [:show]
  def index
  	@advertisements = Advertisement.all.paginate(page: params[:page],per_page: 5).reorder('name DESC')
  end                 

  def new
  	@advertisement = Advertisement.new
  end

  def show
  	@advertisement = Advertisement.find(params[:id])
  end

  def edit
    @advertisement = Advertisement.find(params[:id])
  end

  def update
    reset_check_box
    @advertisement = Advertisement.find(params[:id])
    if @advertisement.update(advertisement_params)
      redirect_to advertisements_path
    else
      render :edit
    end
  end
  def create
    @advertisement = Advertisement.new(advertisement_params)
    
    if @advertisement.save 
      @publication = current_user.publications.new(:advertisement_id => @advertisement.id)
      if @publication.save
        redirect_to @advertisement
      else
      render :new
      end
    else
      render :new
    end
  end
  def destroy
    @publication = Publication.find_by(advertisement_id: params[:id])
    Publication.destroy(@publication.id)
    if Advertisement.destroy(params[:id])
      redirect_to advertisements_path
    end 
  end

  private

  def advertisement_params
    params.require(:advertisement).permit(:name, :photo, :body, :direccion, :url, :telefono, :slogan, :ciudad, :cover,:state,:phone)
  end
  
  def reset_check_box 
    advertisement = Advertisement.find(params[:id])
    
    if advertisement.may_desactivar1?
      advertisement.desactivar1!
    end
    if advertisement.may_desactivar2?
      advertisement.desactivar2!
    end
    if advertisement.may_desactivar3?
      advertisement.desactivar3!
    end
    if advertisement.may_inavilitar1?
      advertisement.inavilitar1!
    end
    if advertisement.may_inavilitar2?
      advertisement.inavilitar2!
    end
    if advertisement.may_inavilitar3?
      advertisement.inavilitar3!
    end
    if advertisement.may_inavilitardesactivo?
      advertisement.inavilitardesactivo!
    end
  end

end
