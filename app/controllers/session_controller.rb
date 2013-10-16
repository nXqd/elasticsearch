class SessionController < ActionController::Base
  def create
    redirect_to root_url, :notice => "Signed in!"
  end
end
