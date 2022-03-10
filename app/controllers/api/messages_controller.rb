class Api::MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  respond_to :html, :json

  # GET /messages or /messages.json
  def index
    @messages = Message.where(nil) 
    @messages = @messages.filter_by_tag(params[:tag]) if params[:tag].present?
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)
    @message.video.attach(params[:message][:video])
    @message.thumb.attach(params[:message][:thumb])
    respond_to do |format|
      if @message.save
        format.html { redirect_to api_messages_path, notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to api_messages_path, notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to api_messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:title, :description, :tag, :video, :thumb, :speaker_id)
    end

    def find_and_set_query_parameters(request)
      if !request.query_parameters.any?
          request.query_parameters.each do |scope, value|
              @messages = @messages.presence || @speaker.messages
              @messages = @messages.select do |message|
                  message.send("#{scope}").to_s == value
              end
          end
      else
          @messages = @speaker.messages
      end
  end
end
                        