require  'digest/sha2'


class SessionsController < ApplicationController

skip_before_filter :authorize #mark only those methods that specifically need authorization

  def new
  end

  def create  #checks user if they are admin's or normal user
	#@User = User.new
	#if user = User.authenticates((params[:name],params[:password]))	
		#session[:user_id] = user.id
		#redirect_to admin_url
	#else
	#	redirect_to login_url, :alert => "Invalid user/password combination that is been entered please provide valid inputs"
	#end

	#theLoggedInUser = validateInput(params[ :name], params[ :password])
	username = params[:name]
	password = params[:password]
	if username.nil?
		 redirect_to login_url, :alert => "Invalid user/password combination that is been entered please provide valid inputs"
	else
		#session[:user_id] = user.id
                redirect_to admin_url
	end
  end

  def destroy #destroy the session or equate the session to nil and redirect the user
	session[:user_id] = nil
	redirect_to store_url, :notice => "Successfully Logged out !!"
  end

 
end
