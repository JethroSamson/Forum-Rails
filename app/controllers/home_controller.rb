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
    def index
        # @posts = Post.order('posts.created_at DESC')
        @accounts = Account.all
        @posts = Post.where('title LIKE ?', "%#{params[:title]}%").paginate(:per_page => 5, :page => params[:page]).order('posts.created_at DESC')
        respond_to do |format|
            format.json { render :json => @posts }
            format.html
        end
    end
    def show
        @account = Account.find(params[:id])
        @posts = Post.where("account_id = ?", params[:id])
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
