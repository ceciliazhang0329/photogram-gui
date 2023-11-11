class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order(username: :asc)
    render(template: "user_template/index")
  end

  def show
    url_username = params.fetch("username")
    @the_user = User.find_by(username: url_username)
    render(template: "user_template/show")
  end
end
