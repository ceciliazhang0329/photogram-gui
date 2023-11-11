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

  def create
    input_username = params.fetch("input_username")

    new_user = User.new
    new_user.username = input_username
    new_user.save

    redirect_to("/users/#{new_user.username}")

  end

  def update
    url_id = params.fetch("id")
    the_user = User.find_by(id: url_id)

    new_username = params.fetch("input_username")
    the_user.username = new_username
    the_user.save

    redirect_to("/users/#{the_user.username}")
  end 
end
