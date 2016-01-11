class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  # Lazy Registration adapted from https://www.bignerdranch.com/blog/lazy-user-registration-for-rails-apps/
  # see also http://stackoverflow.com/questions/14455375/anonymous-user-in-devise-rails
  def authenticate_user!(*args)
    current_user.present? || super(*args)
  end

  def current_user
    super || Participant.find_safely(participant_token)
  end

  private

  def participant_token
    session[:participant_token] ||= SecureRandom.uuid
  end
end
