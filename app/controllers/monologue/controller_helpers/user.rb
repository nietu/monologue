require 'active_support/concern'

module Monologue
  module ControllerHelpers
    module User
      extend ActiveSupport::Concern

      included do
        helper_method :monologue_current_user
      end

      private
      def monologue_current_user
        #@monologue_current_user ||= Monologue::User.find(session[:monologue_user_id]) if session[:monologue_user_id]
        @monologue_current_user ||= spree_current_user
      end
    end
  end
end