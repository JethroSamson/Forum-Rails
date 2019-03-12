class HomeController < ApplicationController
    skip_before_action :verify_authenticity_token
    #require 'moment'
    def self.search(search)
        if search
          where('title LIKE ?', "%#{title}%").paginate(:per_page => 10, :page => params[:page]).order('posts.created_at DESC')
        else
            render json: {
                message: "f"
            } 
        end
        respond_to do |format|
            format.json { render :json => @posts }
            format.html
        end
      end
    def testing
        @accounts = Account.all
        @posts = Post.where('title LIKE ?', "%#{params[:title]}%").order('posts.created_at DESC')
    end
    def index
        # @posts = Post.order('posts.created_at DESC')
        @accounts = Account.all
        @posts = Post.where('title LIKE ?', "%#{params[:title]}%").paginate(:per_page => 10, :page => params[:page]).order('posts.created_at DESC')
        @tops = Post.select("id", "comments_count", "title", "account_id").where("comments_count > ?", 0 ).order("comments_count DESC").limit(3)
        respond_to do |format|
            format.json { render :json => @posts }
            format.html
        end
    end
    def show
        @accounts = Account.all
        @account = Account.find(params[:id])
        @posts = Post.where("account_id = ?", params[:id]).order('posts.created_at DESC')
        user_email = Account.select("email").where("id = ?", params[:id])
        @user_tops = Post.select("id", "comments_count", "title", "account_id").where("account_id = ?", params[:id]).where("comments_count > ?", 0 ).order("comments_count DESC").limit(3)
        @posts.count
    end
    def edit
        @account = Account.find(params[:id])
    end
    def update
        @account = Account.find(params[:id])
       
        if @account.update(account_params) 
            render json: {
                message: "success"
            }
        else
            render json: {
                message: "failed"
            } 
        end
    end
    def destroy
        # @post = Post.find(params[:id])
        # respond_to do |format|
        #     format.json { render :json => @post }
        #     format.html
        # end
        # @post.destroy
        #     render json: {
        #         message: "success"
        #     }
    end
    private
    def account_params
        params.require(:account).permit(:id, :first, :last, :email, :password, :image, :desc)
    end
end
