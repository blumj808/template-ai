class SheltersController < ApplicationController
  def index
    matching_shelters = Shelter.all

    @list_of_shelters = matching_shelters.order({ :created_at => :desc })

    render({ :template => "shelters/index" })
  end

  def show
    the_id = params.fetch("path_id")
  
    matching_shelters = Shelter.where({ :id => the_id })
  
    @the_shelter = matching_shelters.at(0)
  
    # Get all dogs associated with this shelter
    @list_of_dogs = @the_shelter.dogs.order({ :created_at => :desc })
  
    render({ :template => "shelters/show" })
  end

  def create
    the_shelter = Shelter.new
    the_shelter.name = params.fetch("query_name")
    the_shelter.city = params.fetch("query_city")
    the_shelter.state = params.fetch("query_state")
    the_shelter.dog_id = params.fetch("query_dog_id")
    the_shelter.description = params.fetch("query_description")
    the_shelter.image = params.fetch("query_image")
    the_shelter.dogs_count = params.fetch("query_dogs_count")

    if the_shelter.valid?
      the_shelter.save
      redirect_to("/shelters", { :notice => "Shelter created successfully." })
    else
      redirect_to("/shelters", { :alert => the_shelter.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_shelter = Shelter.where({ :id => the_id }).at(0)

    the_shelter.name = params.fetch("query_name")
    the_shelter.city = params.fetch("query_city")
    the_shelter.state = params.fetch("query_state")
    the_shelter.dog_id = params.fetch("query_dog_id")
    the_shelter.description = params.fetch("query_description")
    the_shelter.image = params.fetch("query_image")
    the_shelter.dogs_count = params.fetch("query_dogs_count")

    if the_shelter.valid?
      the_shelter.save
      redirect_to("/shelters/#{the_shelter.id}", { :notice => "Shelter updated successfully."} )
    else
      redirect_to("/shelters/#{the_shelter.id}", { :alert => the_shelter.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_shelter = Shelter.where({ :id => the_id }).at(0)

    the_shelter.destroy

    redirect_to("/shelters", { :notice => "Shelter deleted successfully."} )
  end
end
