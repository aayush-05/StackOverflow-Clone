class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(id: params[:id])
    @questions = @tag.questions.order(created_at: :desc)
  end
end
