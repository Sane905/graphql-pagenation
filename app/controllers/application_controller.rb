class ApplicationController < ActionController::API
  include FirebaseAuth
  include ActionController::Cookies

  private

  def current_user
    @current_user ||= find_form_id_token!
  end
end
