class StaticPagesController < ApplicationController
  def source
    if(params[:fingerprint] != nil)
      user = User.find_by_fingerprint(params[:fingerprint])
      if(user != nil)
        redirect_to user_path(user.id)
      else
        redirect_to home_path
      end
    end
  end
  def home
  end
  def help
  end
  def about

  end
end
