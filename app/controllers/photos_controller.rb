class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order(created_at: :desc)
    render(template: "photo_template/index")
  end

  def show
    url_id = params.fetch("id")
    @the_photo = Photo.find_by(id: url_id)
    render(template: "photo_template/show")
  end

  def destroy
    url_id = params.fetch("id")
    the_photo = Photo.find_by(id: url_id)
    the_photo.destroy
    redirect_to("/photos")
  end 

  def create
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")

    new_photo = Photo.new
    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id
    
    new_photo.save

    redirect_to("/photos/#{new_photo.id.to_s}")
  end

  def update
    url_id = params.fetch("id")
    the_photo = Photo.find_by(id: url_id)
    
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")

    the_photo.image =  input_image
    the_photo.caption = input_caption
    the_photo.save

    redirect_to("/photos/#{the_photo.id.to_s}")
  end

  def comment
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_comment = params.fetch("input_comment")

    new_comment = Comment.new
    new_comment.photo_id = input_photo_id
    new_comment.author_id = input_author_id
    new_comment.body = input_comment
    
    new_comment.save

    redirect_to("/photos/#{input_photo_id}")    

  end 
end
