class Notification < ApplicationRecord
  scope :unread_notification, ->{where read_at: nil}
end
