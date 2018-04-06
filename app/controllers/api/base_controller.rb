require 'api_responder'

module Api
  class BaseController < ActionController::API
    include ActionController::ImplicitRender
    include CanCan::ControllerAdditions
    include ActionController::Serialization
    include PaperTrail::Rails::Controller

    self.responder = ::ApiResponder

    respond_to :json

    before_action :authenticate_user!
    alias authenticate_author authenticate_user

    before_action :set_paper_trail_whodunnit

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from CanCan::AccessDenied, with: :unauthorized

    def _serialization_scope
      :current_ability
    end

    private

    def not_found
      render(head: true, status: :not_found) && return
    end

    def unauthorized
      render(head: true, status: :unauthorized) && return
    end

    def meta_attributes(resource, opts = {})
      { current_page: resource.current_page,
        first_page: 1,
        next_page: resource.next_page,
        prev_page: resource.prev_page,
        last_pages: resource.total_pages,
        total_pages: resource.total_pages,
        total_count: resource.total_count }.merge(opts)
    end
  end
end
