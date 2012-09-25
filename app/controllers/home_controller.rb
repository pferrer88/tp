class HomeController < ApplicationController
  def index
    # @users = User.all
    @tunes = Tune.where(:user_id => (current_user.followees(User).push(current_user))).order('created_at DESC')
  end
end
