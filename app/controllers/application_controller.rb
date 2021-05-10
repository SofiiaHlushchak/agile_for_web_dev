class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  before_action :authorize
  
  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end

  def set_i18n_locale_from_params
    locale = params[:locale] || cookies[:locale]
    # binding.pry
    if locale
      if I18n.available_locales.map(&:to_s).include?(locale)
        cookies[:locale] = locale
        I18n.locale      = locale
      else
        flash.now[:notice] =
        "#{locale} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end
end
