# frozen_string_literal: true

module EacUsersSupport
  class ApplicationController < (
      defined?(::ApplicationController) ? ::ApplicationController : ::ActionController::Base
    )
  end
end
