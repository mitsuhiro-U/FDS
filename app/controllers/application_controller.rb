class ApplicationController < ActionController::Base


    def after_sign_in_path_for(resource)
      case resource
        when User
          users_path
        when Enterprise
          enterprise_enterprises_path
      end
    end

    def after_sign_out_path_for(resource)
        #binding.pry
        case resource
        when :user
          top_path
        when :enterprise
          enterprise_top_path
        end
    end

end
