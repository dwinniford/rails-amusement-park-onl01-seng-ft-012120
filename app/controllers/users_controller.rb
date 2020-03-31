class UsersController < ApplicationController
  def new
    @user = User.new 
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    end
  end

  def show 
    if logged_in?
      @user = User.find(session[:user_id])
    else 
      redirect_to root_path
    end 
  end

  private 

  def user_params 
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def logged_in? 
    !!session[:user_id]
  end


end

# rspec spec/features/users_features_spec.rb:279