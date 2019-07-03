module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    return @current_user
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def fillheader
    if !current_user.nil?
      raw('
        <div class="col-sm-4 col-md-2">
        <a href="/users/' + @current_user.id.to_s + '" class="nav-link d-inline-flex text-white m-0 float-right">
          <img src="/assets/logoLogin.png" class="rounded-circle mr-2" id="avatarTop">
          <p class="text-white pt-2 m-0"><b>Dinh Thuan</b></p>
        </a>
      </div>
      <div class="col-sm-1 col-md-1">
        <a href="/logout" data-method="delete" class="nav-link text-white pt-3 m-0 float-right"><b>Logout</b></a>
      </div>')
    else
      '
        <div class="col-sm-3 col-md-1"></div>
        <div class="col-sm-1 col-md-1">
        <a href="/signup" class="nav-link text-white pt-3 m-0 float-right"><b>Sign up</b></a></div>
        <div class="col-sm-1 col-md-1">
          <a href="/login" class="nav-link text-white pt-3 m-0 float-right"><b>Log in</b></a>
        </div>'.html_safe
    end

  end




end
