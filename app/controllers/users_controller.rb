class UsersController < ApplicationController
  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
