class ApplicationController < ActionController::Base
  include Authentication
  include ApplicationHelper
  before_action :require_login

  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_post_url # halts request cycle
    end
  end
end
