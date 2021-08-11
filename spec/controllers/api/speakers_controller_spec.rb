require 'rails_helper'
RSpec.describe Api::SpeakersController do
    def index
        @speakers = Speaker.all
        render json: @speakers, status: 200
      end
end