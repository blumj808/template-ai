Rails.application.routes.draw do

  get("/", { :controller => "home", :action => "home" })

  # Routes for the Owner resource:

  post("/login", { :controller => "sessions", :action => "create" })

  get("/logout", { :controller => "sessions", :action => "destroy" })

  # CREATE
  post("/insert_owner", { :controller => "owners", :action => "create" })
          
  # READ
  get("/owners", { :controller => "owners", :action => "index" })
  
  get("/owners/:path_id", { :controller => "owners", :action => "show" })
  
  # UPDATE
  
  post("/modify_owner/:path_id", { :controller => "owners", :action => "update" })
  
  # DELETE
  get("/delete_owner/:path_id", { :controller => "owners", :action => "destroy" })

  #------------------------------

  # Routes for the Dog resource:

  # CREATE
  post("/insert_dog", { :controller => "dogs", :action => "create" })
          
  # READ
  get("/dogs", { :controller => "dogs", :action => "index" })
  
  get("/dogs/:path_id", { :controller => "dogs", :action => "show" })

  get("/dogs/:path_id", { :controller => "dogs", :action => "sentence" })
  
  # UPDATE
  
  post("/modify_dog/:path_id", { :controller => "dogs", :action => "update" })
  
  # DELETE
  get("/delete_dog/:path_id", { :controller => "dogs", :action => "destroy" })

  #------------------------------

  # Routes for the Shelter resource:

  # CREATE
  post("/insert_shelter", { :controller => "shelters", :action => "create" })
          
  # READ
  get("/shelters", { :controller => "shelters", :action => "index" })
  
  get("/shelters/:path_id", { :controller => "shelters", :action => "show" })
  
  # UPDATE
  
  post("/modify_shelter/:path_id", { :controller => "shelters", :action => "update" })
  
  # DELETE
  get("/delete_shelter/:path_id", { :controller => "shelters", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'sign_up', to: 'users#new', as: :sign_up
  post 'users', to: 'users#create'
end
