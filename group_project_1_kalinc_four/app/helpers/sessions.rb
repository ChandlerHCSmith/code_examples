  def current_user
    # TODO: return the current user if there is a user signed in.

    if session[:user_id] == nil
      return nil
    else
      User.find(session[:user_id])
    end
  end

    def current_user2
    # TODO: return the current user if there is a user signed in.

    if session[:user2_id] == nil
      return nil
    else
      User.find(session[:user2_id])
    end
  end