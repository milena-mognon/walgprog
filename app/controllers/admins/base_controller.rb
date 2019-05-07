class Admins::BaseController < ActionController::Base
  protect_from_forgery with: :exception

  breadcrumb 'home', :admins_root_path, match: :exact

  layout 'layouts/admins/application'
end
