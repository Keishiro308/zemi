class ApplicationController < ActionController::Base
  private
    def member?
      if current_user.present?
        unless current_user.member
          flash[:alert] = '認証されていません'
          redirect_to member_root_path
        end
      else
        flash[:alert] = 'ログインしてください'
        redirect_to user_session_path
      end
    end
end
