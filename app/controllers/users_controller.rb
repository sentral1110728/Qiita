class UsersController < ApplicationController
  def show
    @nickname = User.find(params[:id]).nickname
    @articles = User.find(params[:id]).articles
  end
end
