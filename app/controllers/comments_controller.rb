class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [ :edit, :update, :destroy, :show  ]
  before_action :set_submission

  def new
  end

  def show
  end

  def create
    @comment = @submission.comments.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to submission_path(@submission), notice: "Comment create succesfully" }
      else
        format.turbo_stream
        format.html { redirect_to submission_path(@submission), alert: "Comment could not be created" }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream
        format.html { redirect_to submission_path(@submission), notice: "Comment create succesfully" }
      else
        format.turbo_stream
        format.html { redirect_to submission_path(@submission), alert: "Comment could not be created" }
      end
    end
  end

  def destroy
    @comment.destroy
    redirect_to submission_path(@submission)
  end

  def upvote
  end

  def downvote
  end

  private

    def set_submission
      @submission = Submission.find(params[:submission_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:reply, :submission_id)
    end
end
