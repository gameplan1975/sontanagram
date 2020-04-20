class BlogsController < ApplicationController
  before_action :protect, only: [:edit, :update, :destroy]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

    def index
      @blogs = Blog.where(user_id: current_user.id)
    end

    def show
      @blog = Blog.find_by(id: params[:id])
      @user = User.find_by(id: @blog.user_id)
    end
  
    def new
      @blog = Blog.new
    end
  
    def edit
    end
  
    def create
      @blog = Blog.new(blog_params)
      @blog.user_id = current_user.id
  
      if @blog.save
        ContactMailer.contact_mail(current_user).deliver
        redirect_to @blog, notice: 'ブログを投稿しました'
      else
        render :new
      end
    end
  
    def update
      if @blog.update(blog_params)
        redirect_to @blog, notice: '投稿を編集しました.'
      else
        render :edit
      end
    end
  
    def destroy
      @blog.destroy
      redirect_to blogs_url, notice: '投稿を削除しました'
    end

    def list
      @blogs = Blog.all
      #いいねした人の人数の数え方がわかったら、ここを記載する
      #@favo_count = Favorite.where(blog_id:      )
    end
  
    private
      def set_blog
        @blog = Blog.find(params[:id])
      end

      def protect
        #@blog = Blog.find_by(id:params[:id])
        #@blog.user_id != current_user.id
        #redirect_to "/", notice: "権限がありません"
      end        
  
      def blog_params
        params.require(:blog).permit(:content, :blog_image, :blog_image_cache, :user_id)
      end
end