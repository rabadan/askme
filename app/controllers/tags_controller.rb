class TagsController < ApplicationController
  def show
    @tags = Tag.all
    @tag = Tag.find_by(name: "##{params[:name]}")
    @questions = @tag.questions.distinct
  end
end