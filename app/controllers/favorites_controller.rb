class FavoritesController < ApplicationController
    def create
      @favorite = Favorite.new(user_id: current_user.id, blog_id: params[:blog_id])
      @favorite.save
      redirect_to("/blogs/#{params[:blog_id]}")
    end
    
    def destroy
      @favorite = Favorite.find_by(user_id: current_user.id, blog_id: params[:blog_id])
      @favorite.destroy
      redirect_to("/blogs/#{params[:blog_id]}")
    end
end
