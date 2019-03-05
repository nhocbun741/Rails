class ApplicationController < ActionController::Base
    before_action :setLocale
    def setLocale
      I18n.locale = params[:locale] if params[:locale].present?
    end
    before_action :authenticate_admin!
end
