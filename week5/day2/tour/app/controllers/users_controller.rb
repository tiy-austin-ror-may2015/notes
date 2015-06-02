class UsersController < ApplicationController
  def index #Methods are called Actions in Controllers
    all_users = User.all
    string_users = all_users.map do |user|
      "#{user.first_name} #{user.last_name}"
    end
    render text: pad(string_users.join('~'))
  end

  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render text: pad(user.first_name)
    else
      render text: 'User Not Found', status: 404
    end
  end

  private
  def pad(msg)
    ("-" * 10) + msg
  end
end
