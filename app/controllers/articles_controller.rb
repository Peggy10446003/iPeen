class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :destroy]
    
    def index
      @articles = Article.all
    end
    
    def new
      @article = Article.new
    end
    
    def edit
    end
    
    def create
      @article = Article.new(article_params)

      if @article.save
        # 成功
        redirect_to articles_path, notice: "新增文章成功!"
      else
        # 失敗
        render :new
      end
    end
    
    def update
      if @article.update(article_params)
        # 成功
        redirect_to articles_path, notice: "資料更新成功!"
      else
        # 失敗
        render :edit
      end
    end
    
    def destroy
      @article.destroy if @article
      redirect_to articles_path, notice: "文章資料已刪除!"
    end

    
    private
    
    def article_params
      params.require(:article).permit(:name, :title, :content)
    end
    
    def find_article
      @article = Article.find_by(id: params[:id])
    end
end
