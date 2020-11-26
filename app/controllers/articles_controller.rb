class ArticlesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
    def top
        
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            redirect_to articles_path, notice: '送信しました'
        else
            render :new
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = current_user.articles.find(params[:id])
    end

    def update
        @article = current_user.articles.find(params[:id])
        if @article.update(article_params)
            redirect_to articles_path, notice: '編集しました'
        else
            render :edit
        end
    end

    def destroy
        @article = current_user.articles.find(params[:id])
        @article.destroy!
        redirect_to articles_path, notice: '削除しました'
    end

    private 
    def article_params
        params.require(:article).permit(:content)
    end
end