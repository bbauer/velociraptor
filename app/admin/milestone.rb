ActiveAdmin.register Milestone do
  permit_params :title, :description, :status, :client_id, :user_id
end
