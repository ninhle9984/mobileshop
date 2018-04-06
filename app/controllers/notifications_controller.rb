class NotificationsController < ApplicationController
  before_action :force_json
  before_action :unread_messages

  def index
    @notifications = Notification.desc.all
  end

  # rubocop:disable Rails/SkipsModelValidations

  def update
    if unread_message
      unread_message.update_attributes readed: true
    else
      unread_messages.update_all read_at: Time.zone.now
      render json: {success: true}
    end
  end

  # rubocop:enable Rails/SkipsModelValidations

  private

  def unread_messages
    @unread_messages ||= Notification.unread_notification
  end

  def unread_message
    Notification.find_by id: params_unread if params_unread
  end

  def params_unread
    params[:unread]
  end
end
