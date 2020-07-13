class ChatNotice < ApplicationRecord
  # default_scope デフォルトの並び順を「作成日時の降順」で指定
  default_scope -> { order(created_at: :desc) }
  belongs_to :chat
  belongs_to :guide_visitor, class_name: 'Guide', foreign_key: 'visitor_id', optional: true
  belongs_to :guide_visited, class_name: 'Guide', foreign_key: 'visited_id', optional: true
  belongs_to :tourist_visitor, class_name: 'Tourist', foreign_key: 'visitor_id', optional: true
  belongs_to :tourist_visited, class_name: 'Tourist', foreign_key: 'visited_id', optional: true
end
