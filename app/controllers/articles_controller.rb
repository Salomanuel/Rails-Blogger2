class ArticlesController < ApplicationController
	def index		# 1
		@articles = Article.all
	end

	def show		# 2
		@article = Article.find(params[:id])
	end

	def new 		# 3
		@article = Article.new
	end

	def create	# 4
		@article = Article.new(article_params)
		@article.save
		redirect_to @article
	end

	def edit		# 5
		@article = Article.find(params[:id])
	end

	def update 	# 6
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated!"
		
		redirect_to article_path(@article)
	end

	def destroy	# 7
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :body)
		end
end
