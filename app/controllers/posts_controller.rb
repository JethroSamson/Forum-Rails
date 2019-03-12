class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @post = Post.find(params[:home_id])
        @comments = Comment.where("post_id = ?", params[:home_id]).paginate(:per_page => 10, :page => params[:page])
        @comments.count
        @accounts = Account.select('id', 'image', 'first').all
        @tops = Post.select("id", "comments_count", "title", "account_id").order("comments_count DESC").limit(3)
        respond_to do |format|
            format.json { render :json =>  { :comments => @comments.last,
                                            :acct => @accounts,
                                            :nn => current_account.id }}
            format.html
        end
    end
    def show
        @post = Post.find(params[:home_id])
    end
    def create
        @home = Account.find(params[:home_id])
        @post = @home.posts.create(post_params)
            if @post.save
                render json: {
                    message: "success",
                    status: :ok
                }
            else
                render json: {
                    message: "failed",
                }
            end
            
      end
      def update
        @post = Post.find(params[:id])
       
        if @post.update(post_params) 
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
        @post = Post.find(params[:id])
            if @post.destroy
                render json: {
                    message: "success"
                }
            else
                render json: {
                    message: "failed"
                }  
        end
      end
    private
        def post_params
            params.require(:post).permit(:email, :title, :content, :image)
        end
end
