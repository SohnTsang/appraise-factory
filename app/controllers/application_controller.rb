class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method :current_user, :signed_in?, :is_admin?

  private

    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource_or_scope)
      if current_user.admin?
        posts_path
      else
        home_user_page_path
      end
    end

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin_admin_user
        home_user_page_path
      else
        root_path
      end
    end
end
