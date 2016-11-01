class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comments_params)
    @comment.job_id = params[:comment][:job_id]
    @comment.save
    
    redirect_to company_job_path(@comment.job.company, @comment.job)
  end

  private
  def comments_params
    params.require(:comment).permit(:note, :job_id)
  end

end
