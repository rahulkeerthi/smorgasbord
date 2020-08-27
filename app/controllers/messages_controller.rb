class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message.chat_room = @chat_room
    @message.user = current_user
    if @message.save!
      ChatRoomsChannel.broadcast_to(
        @chat_room,
        render_to_string(partial: "message", locals: { message: @message, user_is_messages_author: current_user == @message.user  })
      )
      redirect_to chat_room_path(@chat_room, anchor: "message-#{@message.id}")
    else
      render 'chat_rooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
