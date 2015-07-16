class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery except: :some_action
  protect_from_forgery except: [:some_action1, :some_action2]
end
