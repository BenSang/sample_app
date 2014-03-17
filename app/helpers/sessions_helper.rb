module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token    #创建新标权
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))     #跟第一句代码一起使用，将标权写进数库
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.hash(cookies[:remember_token])
    #当且仅当@current_user未定义是才会把通过记忆权标获取的用户赋值给实例变量@current_user
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_in?
    !current_user.nil?
  end

  def sign_out
    #当用户退出登录的时候新创建一个权标
    current_user.update_attribute(:remember_token,
                                  User.hash(User.new_remember_token))
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default )
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath if request.get?
  end

  def signed_in_user
    unless sign_in?
      store_location
      redirect_to signin_url, notice:"Please sign in"
    end
  end

end
