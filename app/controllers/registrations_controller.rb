class RegistrationsController < Devise::RegistrationsController
    
  before_action :configure_permitted_parameters, only: [:update]

  def edit 
    resource.build_profile if resource.profile.nil?
  end

  private
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
  def after_update_path_for(resource)
    edit_user_registration_path
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [profile_attributes: 
      [:id, :last_name, :first_name, :nickname, :language]
    ])
  end
end