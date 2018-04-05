module Auth
  class RegistrationsController < Devise::RegistrationsController
    before_action :authorize_update_password?, only: %i[edit update]

    layout 'sessions'

    def edit
      render :edit
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Style/MultilineTernaryOperator
    def update
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

      if update_resource(resource, account_update_params)
        yield resource if block_given?
        sign_out resource
        if is_flashing_format?
          flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
                          :update_needs_confirmation : :updated
          set_flash_message :notice, flash_key
        end
        respond_with resource, location: send(:"new_#{resource_name}_session_path")
      else
        clean_up_passwords resource
        respond_with resource
      end
    end

    private

    def authorize_update_password?
      authorize! :change_pwd, current_user
    end
  end
end
