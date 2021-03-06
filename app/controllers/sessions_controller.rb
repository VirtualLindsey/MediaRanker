require 'date'
class SessionsController < ApplicationController
  def new
  end



  def create
    if params[:name] == ""
      flash[:login] = "Username: can't be blank"
      redirect_to login_path

    else
      user = User.find_by(name: params[:name])

      if user
        flash[:notice] = 'Logged in as existing user'
        session[:user_id] = user.id
        redirect_to root_path, notice: "Successfully logged in as existing user #{user.name}"
      else
        @new_user = User.new
        @new_user.joined_on = Date.today
        @new_user.name = params[:name]
        if @new_user.save
          session[:user_id] = @new_user.id
          flash[:notice] = "Successfully created new user #{@new_user.name} with ID #{@new_user.id}"
          redirect_to root_path
        else
          session[:failure] = "Failed to create new user #{@new_user.name}"
        end
      end
    end

  end

  def destory
    session[:user_id] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to root_path
  end

end
