# frozen_string_literal: true

module EacUsersSupport
  class ApplicationController < (
      begin
        ::ApplicationController
      rescue NameError
        ::ActionController::Base
      end
    )
  end
end
