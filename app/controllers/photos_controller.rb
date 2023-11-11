class UsersController < ApplicationController
  def index
    @list_of_photos = Photo.all.order(id: :asc)
    render(template: "photo_template/index")
  end

end
