# frozen_string_literal: true

module ApplicationHelper
  def unchecked_notifications
    @notifications = current_guide.notifications.where(checked: false)
  end

  def unchecked_tourist_chat_notices
    rooms = current_tourist.rooms
    notices = []
    rooms.each do |room|
      room.chats.each do |chat|
        next if chat.is_tourist

        notices << chat.chat_notices.where(checked: false, visited_id: current_tourist.id) unless chat.chat_notices.where(checked: false, visited_id: current_tourist.id).empty?
      end
    end
    notices
  end

  def unchecked_guide_chat_notices
    rooms = current_guide.rooms
    notices = []
    rooms.each do |room|
      room.chats.each do |chat|
        next unless chat.is_tourist

        notices << chat.chat_notices.where(checked: false, visited_id: current_guide.id) unless chat.chat_notices.where(checked: false, visited_id: current_guide.id).empty?
      end
    end
    notices
  end
end
