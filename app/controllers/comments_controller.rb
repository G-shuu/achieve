class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(user_id: current_user)


    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end
end
