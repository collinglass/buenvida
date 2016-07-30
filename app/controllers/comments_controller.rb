class CommentsController < ApplicationController
  before_action :set_memory

  def index
    @comments = @memory.comments.order("created_at ASC")
    respond_to do |format|
      format.html { render layout: !request.xhr? }
    end
  end

  def create
    @comment = @memory.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      create_notification @memory, @comment
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
  end

  def destroy
    @comment = @memory.comments.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.delete
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  def set_memory
    @memory = Memory.find(params[:memory_id])
  end
  def create_notification(memory, comment)
    return if memory.user.id == current_user.id
    Notification.create(user_id: memory.user.id, notified_by_id: current_user.id, memory_id: memory.id, identifier: comment.id, notice_type: 'comment')
  end
end
