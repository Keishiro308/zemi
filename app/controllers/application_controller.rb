class ApplicationController < ActionController::Base
  private
    def member?
      unless current_user.member
        flash[:alert] = '認証されていません'
        redirect_to member_root_path
      end
    end
end
