class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.where(read: false)
  end

  def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
    redirect_to memory_path @notification.memory
  end
end
