class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def current_or_guest_user
    current_user || guest_user
  end
  helper_method :current_or_guest_user

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(:name, :biography, :avatar)
      devise_parameter_sanitizer.for(:account_update).push(:name, :biography, :avatar)
    end


  private
    def guest_user
      session[:guest_user_id] = session[:guest_user_id].present? ? session[:guest_user_id] : create_guest_user.id
      User.find(session[:guest_user_id])
    end

    def create_guest_user
      u = User.create(name: "Guest", email: "guest_#{Time.now.to_i}#{rand(99)}@example.com", type: "Guest")
      u.save(validate: false)
      u
    end

    def token
      cookies[:token] ? cookies[:token] : rand(2468**10).to_s(32)
    end

    def current_order
      cookies[:token] = { value: token, expires: 1.hour.from_now }
      @current_order ||= Order.cart_by(token) || Order.create!(token: token)
      first_time_visit unless session[:first_time]
      @current_order
    end
    helper_method :current_order

    def render_form_error_for object
      error =
        {
          id: object.id,
          model: controller_name.singularize,
          errors: object.errors
        }
      render json: error , status: :unprocessable_entity
    end

    def render_box_error_for object, text = nil
      error = { noty: text ? text : object.errors }
      render json: error, status: :unprocessable_entity
    end

    def first_time_visit
      session[:first_time] = true
      current_order.touch
    end

    def after_sign_in_path_for resource
      URI(request.referer).path == new_guest_path ? edit_cart_path(current_order) : root_path
    end
end
