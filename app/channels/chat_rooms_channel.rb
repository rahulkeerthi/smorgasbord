class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    chatroom = ChatRoom.find(params[:id])
    stream_for chatroom
  end
end
