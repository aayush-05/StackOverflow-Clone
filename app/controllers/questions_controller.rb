class QuestionsController < ApplicationController
  before_action :require_user, only: [:new, :create, :destroy]

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      generate_tags(@question, params[:question][:tags_list])
      flash[:success] = "Question posted successfully"
      redirect_to user_question_path(current_user, @question)
    else
      render :new
    end
  end

  def show
    @question = User.find_by(id: params[:user_id]).questions.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @question.comments
  end

  def destroy
    @question = User.find_by(id: current_user.id).questions.find_by(params[:id])
    @question.destroy
    flash[:success] = "Question deleted successfully"
    redirect_to user_path(current_user)
  end

  private

  def generate_tags(question, tags_list)
    tags_list.split.map do |tag|
      generated_tag = Tag.where(name: tag).first_or_create
      question.question_tags.create(tag: generated_tag)
    end
  end

  def question_params
    params.require(:question).permit(:heading, :description)
  end
end
