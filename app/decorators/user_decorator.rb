class UserDecorator < ApplicationDecorator
  def current_sign_in
    "#{timestamp(current_sign_in_at)} (#{current_sign_in_ip})".html_safe
  end

  def last_sign_in
    "#{timestamp(last_sign_in_at)} (#{last_sign_in_ip})".html_safe
  end
end
