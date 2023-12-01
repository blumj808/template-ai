class OwnersController < ApplicationController
  def index
    matching_owners = Owner.all

    @list_of_owners = matching_owners.order({ :created_at => :desc })

    render({ :template => "owners/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_owners = Owner.where({ :id => the_id })

    @the_owner = matching_owners.at(0)

    render({ :template => "owners/show" })
  end

  def create
    the_owner = Owner.new
    the_owner.name = params.fetch("query_name")
    the_owner.pet_id = params.fetch("query_pet_id")
    the_owner.bio = params.fetch("query_bio")
    the_owner.age = params.fetch("query_age")
    the_owner.gender = params.fetch("query_gender")
    the_owner.dogs_count = params.fetch("query_dogs_count")

    if the_owner.valid?
      the_owner.save
      redirect_to("/owners", { :notice => "Owner created successfully." })
    else
      redirect_to("/owners", { :alert => the_owner.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_owner = Owner.where({ :id => the_id }).at(0)

    the_owner.name = params.fetch("query_name")
    the_owner.pet_id = params.fetch("query_pet_id")
    the_owner.bio = params.fetch("query_bio")
    the_owner.age = params.fetch("query_age")
    the_owner.gender = params.fetch("query_gender")
    the_owner.dogs_count = params.fetch("query_dogs_count")

    if the_owner.valid?
      the_owner.save
      redirect_to("/owners/#{the_owner.id}", { :notice => "Owner updated successfully."} )
    else
      redirect_to("/owners/#{the_owner.id}", { :alert => the_owner.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_owner = Owner.where({ :id => the_id }).at(0)

    the_owner.destroy

    redirect_to("/owners", { :notice => "Owner deleted successfully."} )
  end
end
