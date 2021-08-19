class Enterprise::RoomsController < ApplicationController

  before_action :authenticate_enterprise!

  def index
    @rooms = current_enterprise.rooms
  end

end
