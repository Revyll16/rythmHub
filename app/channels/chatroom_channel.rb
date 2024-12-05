class ChatroomChannel < ApplicationCable::Channel
  def subscribed

    stream_from "chatroom_#{params[:forum_id]}"
  end

  def unsubscribed

  end

  def send_message(data)

    Message.create!(
      content: data['message'],
      user: current_user,
      forum_id: params[:forum_id]  
    )
  end
end
