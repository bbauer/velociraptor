class AdminController < ActionController::Base
  before_filter :authenticate_admin!
end
