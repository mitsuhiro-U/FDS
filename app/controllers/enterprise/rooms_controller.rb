class Enterprise::RoomsController < ApplicationController
  def index
    @rooms = current_enterprise.rooms
  end
end
