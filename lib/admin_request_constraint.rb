class AdminRequestConstraint
  def matches?(request)
    is_admin?(request) || forbidden
  end

protected

  def is_admin?(request)
    request.env['warden'].authenticate? && request.env['warden'].user.admin?
  end

  def forbidden
    throw(:warden)
  end
end
