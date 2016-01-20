class ApplicationController < ActionController::Base
  devise_group :human, contains: [:user, :admin, :guest]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_human!
  protect_from_forgery with: :exception
end
