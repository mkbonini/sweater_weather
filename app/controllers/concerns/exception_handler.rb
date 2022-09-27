module ExceptionHandler
    extend ActiveSupport::Concern
  
    included do
      rescue_from ActiveRecord::RecordNotFound do |e|
        json_response({ error: e.message }, :not_found)
      end
  
      rescue_from ActiveRecord::RecordInvalid do |e|
        json_response({ error: e.message }, :bad_request)
      end

      # rescue_from ActiveRecord::StandardError do |e|
      #   json_response({ error: e.message }, :internal_server_error)
      # end
    end
  end
  