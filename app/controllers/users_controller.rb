class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user.id), notice: "The user has been created!" and return
    end
    render 'new'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path, notice: "#{first_name} #{last_name} has been updated!" and return
    end

    render 'edit'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to user_path, notice: "#{first_name} #{last_name} has been deleted!" and return
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :notes, :avatar, :password)
  end
end