class ConversationsController < ApplicationController
  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end

  def new
    @recipients = User.all - [current_user]
    @drecipients = Driver.all - [current_user]
  end

  def create
    @recipient = User.find(params[:user_id])
    receipt = current_user.send_message(@recipient, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
    # @drecipient = Driver.find(params[:driver_id])
    # if current_user == @recipient
    #   receipt = current_user.send_message(@recipient, params[:body], params[:subject])
    #   redirect_to conversation_path(receipt.conversation)
    # elsif current_user == @drecipient
    #   dreceipt = current_user.send_message(@drecipient, params[:body], params[:subject])
    #   redirect_to conversation_path(dreceipt.conversation)
    # else
    #   redirect_to new_conversation_path
    # end
  end

end
