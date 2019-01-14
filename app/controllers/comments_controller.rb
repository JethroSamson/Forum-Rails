class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def show
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
            if @comment.save
                render json: {
                    message: "success",
                }
            end
            
      end
     
      def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        if @comment.destroy
            render json: {
                message: "deleted",
                :bago => @comment
            }
        end
      end

    private
        def comment_params
            params.require(:comment).permit(:email, :laman, :acctid)
        end
end
