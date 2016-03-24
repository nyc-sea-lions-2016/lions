helpers do
  def current_user
    @current_user ||= SeaLion.find_by(id: session[:sea_lion_id])
  end

  def logged_in?
    !!current_user
  end
end
