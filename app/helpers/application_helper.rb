# frozen_string_literal: true

module ApplicationHelper
  def unchecked_notifications
    @notifications = current_guide.notifications.where(checked: false)
  end

  def unchecked_tourist_chat_notices
    chats = current_tourist.chats
    notices = []
    chats.each do |chat|
      next if chat.is_tourist

      notices << chat.chat_notices.where(checked: false, visited_id: current_tourist.id) unless chat.chat_notices.where(checked: false, visited_id: current_tourist.id).empty?
    end
    notices
  end

  def unchecked_guide_chat_notices
    chats = current_guide.chats
    notices = []
    chats.each do |chat|
      next unless chat.is_tourist

      notices << chat.chat_notices.where(checked: false, visited_id: current_guide.id) unless chat.chat_notices.where(checked: false, visited_id: current_guide.id).empty?
    end
    notices
  end
end
