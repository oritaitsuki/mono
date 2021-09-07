class MessagesController < ApplicationController
  def create
    def create
      message = Message.create(message_params)
      redirect_to "/items/#{message.item.id}"  # コメントと結びつくツイートの詳細画面に遷移する
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  

end


#def create
  #@message = Message.new(text: params[:message][:text])
 # if @message.save
   # ActionCable.server.broadcast 'message_channel', content: @message
   # redirect_to "/items/#{message.item.id}"
  #end
#end