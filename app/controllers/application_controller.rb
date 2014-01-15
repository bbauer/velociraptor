class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

protected

  def after_sign_in_path_for(resource)
    client_path(current_user.client)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
