class BrandsController < ApplicationController
  before_action :authenticate_admin_user!
  
	def index
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
        redirect_to @brand
    else
        render :new
    end

  end

  def show
    @brand_articles = Brand.find(params[:id]).articles.paginate(page: params[:page],per_page: 5).order("created_at DESC")
    @brand = Brand.find(params[:id])
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    
    if Brand.find(params[:id]).update(brand_params)
      redirect_to brands_path
    else
      render :edit
    end
  end

  def destroy
    @phones = Phone.destroy_all(brand_id: params[:id])
    
    @brand = Brand.find(params[:id])
    if @brand.destroy
      redirect_to brands_path
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name,:logo)
  end
end
