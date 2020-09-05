class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if(user.save)
      render json: {status:'SUCCESS',message:'Saved user', data:user},status: :ok
    else
      render json: {status:'ERROR',message:'Saving user failed', data:user.error},status: 400
    end
  end

  def show
    user = User.find(params[:id])
    render json: {status:'SUCCESS',message:'Found user', data:user},status: :ok
  end
  private

    def user_params
      params.require(:user).permit(:name)
    end
end
