class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @messages = Message.where("sender_id = ? or recipient_id = ?", current_student.id, current_student.id)
    respond_with(@messages)
  end

  def show
    respond_with(@message)
  end

  def new
    @message = Message.new
    @message.recipient = Student.find(params.permit(:id)[:id])
    respond_with(@message)
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_student
    @message.save
    respond_with(@message)
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:text, :time, :recipient_id)
    end
end
