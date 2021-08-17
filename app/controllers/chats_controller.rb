class ChatsController < ApplicationController
  
  def show
    if user_signed_in?
      @enterprise = Enterprise.find(params[:id])
      room = Room.find_by(enterprise_id: @enterprise.id, user_id: current_user.id)
      if room.nil?
        room = Room.new
          room.user_id = current_user.id
          room.enterprise_id = @enterprise.id
        room.save
      end
    elsif enterprise_signed_in?
      @user = User.find(params[:id])
      room = Room.find_by(user_id: @user.id, enterprise_id: current_enterprise.id)
      if room.nil?
        room = Room.new
          room.user_id = @user.id
          room.enterprise_id = current_enterprise.id
        room.save
      end
    end

    @chats = room.chats
    @chat = Chat.new(room_id: room.id)
  end

  def create
    if user_signed_in?
      @chat = current_user.chats.new(user_chat_params)
      @chat.save

    elsif enterprise_signed_in?
      @chat = current_enterprise.chats.new(enterprise_chat_params)
      @chat.save
    end
  end

  private

  def user_chat_params
    params.require(:chat).permit(:message, :room_id)
  end

  def enterprise_chat_params
    params.require(:chat).permit(:message, :room_id)
  end


end
