class UsersController < ApplicationController
  def show
    @nickname = User.find(params[:id]).nickname
  end
end
