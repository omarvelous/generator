class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def append_info_to_payload(payload)
    super
    payload[:session_id] = session.id
    payload[:request_ip] = request.ip
    payload[:referer] = request.referer
  end
end
