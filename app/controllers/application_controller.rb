class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
 include Pundit
 protect_from_forgery with: :exception

end
