class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :nothing => true
    end
  end

  def add_users
    File.open(Rails.root.join('users_perm.txt')).each_line do |line|
      data = line.split(/\t/)
      User.create(username: data[0],password: data[1])
    end
    render nothing: true
  end
  
  private
  def user_params
      params.require(:user).permit(:username, :password, :current_question)
  end
end
