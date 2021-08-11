require 'rails_helper'
RSpec.describe Api::MessagesController do
    def index
        @messages = Message.all
        render json: @messages, status: 200
      end
end