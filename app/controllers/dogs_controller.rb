class DogsController < ApplicationController
  def index
    @list_of_dogs = Dog.all.order({ :created_at => :desc })
    #matching_dogs = Dog.all

    #@list_of_dogs = matching_dogs.order({ :created_at => :desc })

    render({ :template => "dogs/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_dogs = Dog.where({ :id => the_id })

    @the_dog = matching_dogs.at(0)

    render({ :template => "dogs/show" })
  end

  def create
    the_dog = Dog.new
    the_dog.name = params.fetch("name")
    the_dog.breed = params.fetch("breed")
    the_dog.age = params.fetch("age")
    the_dog.bio = params.fetch("bio")
    the_dog.shelter_id = params.fetch("shelter_id", nil)
    the_dog.gender = params.fetch("gender")
    the_dog.owner_id = params.fetch("owner_id", nil)
    the_dog.picture = params.fetch("picture",nil)
    the_dog.status = params.fetch("status")

    if the_dog.valid?
      the_dog.save
      redirect_to("/dogs", { :notice => "Dog created successfully." })
    else
      puts the_dog.errors.full_messages
      redirect_to("/dogs", { :alert => "Dog could not be created." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_dog = Dog.where({ :id => the_id }).at(0)

    the_dog.name = params.fetch("query_name")
    the_dog.breed = params.fetch("query_breed")
    the_dog.age = params.fetch("query_age")
    the_dog.bio = params.fetch("query_bio")
    the_dog.shelter_id = params.fetch("query_shelter_id")
    the_dog.gender = params.fetch("query_gender")
    the_dog.owner_id = params.fetch("query_owner_id")
    the_dog.picture = params.fetch("query_picture")
    the_dog.status = params.fetch("query_status")

    if the_dog.valid?
      the_dog.save
      redirect_to("/dogs/#{the_dog.id}", { :notice => "Dog updated successfully."} )
    else
      redirect_to("/dogs/#{the_dog.id}", { :alert => the_dog.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_dog = Dog.where({ :id => the_id }).at(0)

    the_dog.destroy

    redirect_to("/dogs", { :notice => "Dog deleted successfully."} )
  end
end
