class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @post = Post.find(params[:home_id])
        @comments = Comment.where("post_id = ?", params[:home_id])
        @comments.count
        @accounts = Account.select('id', 'image', 'first').all
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
                }
            end
            
      end
     
      def destroy
        @post = Post.find(params[:id])
        @post.destroy
        render json: {
                message: "success"
            }
      end
    private
        def post_params
            params.require(:post).permit(:email, :title, :content)
        end
end
