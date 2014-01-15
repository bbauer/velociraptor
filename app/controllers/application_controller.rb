class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

protected

  def after_sign_in_path_for(resource)
    client_path(current_user.client)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def authenticate_admin!
    #unless ["login", "logout"].include(request.env["PATH_INFO"])
    unless request.env["PATH_INFO"] == "/admin/login" ||request.env["PATH_INFO"] == "/admin/logout"
      redirect_to client_path(current_user.client) unless current_user.admin
    end
  end
end
