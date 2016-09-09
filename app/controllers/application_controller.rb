class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
      cookies.signed[:user_id] ||= spree_current_user.try(:id)
  end
end
