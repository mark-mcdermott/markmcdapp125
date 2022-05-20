class GameController < ApplicationController

  skip_before_action :authorized, only: :index

end
