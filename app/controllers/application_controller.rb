class ApplicationController < ActionController::Base
    def current_account
        @current_account ||= Account.find(session[:id]) if session[:id]
    end
      helper_method :current_account
      
      def authorize
        redirect_to '/'
      end
end
