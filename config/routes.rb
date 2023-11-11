Rails.application.routes.draw do
 
  get("/", controller: "users", action: "index")
  get("/users", controller: "users", action: "index")
  get("/users/:username", controller: "users", action: "show")
  post("/add_user", controller: "users", action: "create")
  post("update_user/:id", controller: "users", action: "update")

  get("/photos", controller: "photos", action: "index")
  get("/photos/:id", controller: "photos", action: "show")
  get("/delete_photo/:id", controller: "photos", action: "destroy")
  post("/insert_photo_record", controller: "photos", action: "create")
  post("/update_photo/:id", controller: "photos", action: "update")
  post("/add_comment", controller: "photos", action: "comment")

end
