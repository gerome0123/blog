require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json

  ensure_security_headers

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #
  before_action :authenticate_user!
  
  alias current_author current_user

  rescue_from CanCan::AccessDenied, with: :unauthorized

  private

  def active_user
    @current_user ||= current_user
  end

  def unauthorized
    render file: Rails.root.join('public', '401.html').to_s, status: :unauthorized, layout: false
  end
end
