
class UsershowsController < ApplicationController
  def show
  	#@user = User.where("name = 'Usuario XC'")
  	@user = User.find(params[:id])
  	@comment = Comment.new
  	comment_all = Comment.where("comentador = '#{@user.id}'").ultimos
    @articulos_vendidos = @user.articles.vendidos.count
  	@commentsvendedor = comment_all.vendedor
  	@commentscomprador = comment_all.comprador
    likes_vendedor = @commentsvendedor.likes.count
    numtotal_vendedor = @commentsvendedor.count
    if numtotal_vendedor > 0
      @likes_porcentaje_vendedor = 100 * likes_vendedor / numtotal_vendedor
    end
    
    likes_comprador = @commentscomprador.likes.count
    numtotal_comprador = @commentscomprador.count
    
    if numtotal_comprador > 0
       @likes_porcentaje_comprador = 100 * likes_comprador / numtotal_comprador
    end

    if numtotal_comprador > 0 && numtotal_vendedor > 0
      @likes_porcentaje_general = ((100 * likes_comprador / numtotal_comprador) + (100 * likes_vendedor / numtotal_vendedor))/2
    elsif numtotal_comprador > 0
      @likes_porcentaje_general = 100 * likes_comprador / numtotal_comprador
    elsif numtotal_vendedor > 0 
      @likes_porcentaje_general = 100 * likes_vendedor / numtotal_vendedor
    end
  end

  def articulos
    @user_articles = User.find_by(name: params[:id]).articles.paginate(page: params[:page],per_page: 3).order("created_at DESC")
    @name = params[:id]
  end


end
