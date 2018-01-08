class SearchController < ApplicationController
	def create
		@busqueda = params[:keyword]
		palabra = "%#{@busqueda}%"
		@phones = Phone.where("lower(name) LIKE ?",palabra.downcase).limit(20)
		#@articles = Article.joins(@phones)
		#@articles = Article.joins(:phones).where(phones: { name: 'sony 3' })
		#@articles = Article.joins(:phones).where(phones: { name: 'sony 3' })

		#@articles = Article.joins("INNER JOIN phones ON phones.article_id = articles.id AND phones.name = 'sony 3'")
		respond_to do |format|
			format.html {redirect_to root_path}
			format.json { render json: @phones}
			format.js
		end
	end
end
