class LikesController < ApplicationController
  before_action :set_comment

  def create
    like = current_user.likes.build(comment_id: params[:comment_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find_by(comment_id: params[:comment_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
