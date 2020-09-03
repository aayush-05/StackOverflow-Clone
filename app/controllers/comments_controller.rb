class CommentsController < ApplicationController
  def create
    @comment = User.find_by(id: params[:user_id]).questions.find_by(id: params[:question_id]).comments.new(comment_params)
    @comment.user = current_user
    question = Question.find_by(id: params[:question_id])
    if @comment.save
      ActionCable.server.broadcast "comments", render(partial: "comments/comment", locals: {comments: @comment})
      # flash[:success] = "Comment posted successfully"
      # redirect_to user_question_path(question.user, question)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
