class HomeController < ApplicationController
  def homepage
  end

  def dashboard
  end

  def profile
    @user=User.find(params[:user_id])
    @message= Message.new
  end
end
