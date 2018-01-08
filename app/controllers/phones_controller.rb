class PhonesController < ApplicationController
  before_action :authenticate_admin_user!, except: [:show,:new,:create]
  def index
  	@brands = Brand.all.paginate(page: params[:page],per_page: 20).order("name")
  end

  def show
  	@phones = Brand.find(params[:id]).phones.paginate(page: params[:page],per_page: 20).order("name")
  end

  def edit
    @phone = Phone.find(params[:id])
  end

  def update
    
    if Phone.find(params[:id]).update(phone_params)
      redirect_to phones_path
    else
      render :edit
    end
  end

  def new
  	@phone = Phone.new
  end
  def create
  	@phone = Phone.new(phone_params)
    if @phone.save
      flash[:notice] = "Telefono agregado con exito"
      redirect_to new_phone_path
    else
      render :new
    end
  end
  def destroy
    if Phone.destroy(params[:id])
      redirect_to phones_path
    end
      
  end

  private

  def phone_params
    params.require(:phone).permit(:name,:brand_id)
  end

end
