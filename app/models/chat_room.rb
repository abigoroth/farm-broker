class ChatRoom < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :receiver, foreign_key: :receiver_id, class_name: 'User'

  has_many :messages

  validates_uniqueness_of :sender_id, scope: :receiver_id

  scope :involving, -> (user) do
    where("chat_rooms.sender_id = ? OR chat_rooms.receiver_id = ?", user.id, user.id)
  end

  scope :between, -> (sender_id, receiver_id) do
    where("(chat_rooms.sender_id = ? AND chat_rooms.receiver_id = ?) OR (chat_rooms.sender_id = ? AND chat_rooms.receiver_id = ?)", sender_id, receiver_id, receiver_id, sender_id)
  end
end
