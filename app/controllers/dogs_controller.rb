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

    matching_shelters = Shelter.where({ :id => @the_dog.shelter_id })
    @the_shelter = matching_shelters.at(0)

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

  def sentence
    @sentences = generate_dog_sentences
  end

  private

  def generate_dog_sentences
    adjectives = ["playful", "loving", "energetic", "lazy", "curious", "loyal",
      "protective", "friendly", "gentle", "intelligent", "courageous", "timid",
      "obedient", "adventurous", "agile", "trainable", "independent", "sociable",
      "patient", "dignified", "polite", "confident", "faithful", "athletic",
      "tenacious", "affectionate", "sensitive", "devoted", "alert", "reliable",
      "determined", "brave", "even-tempered", "amiable", "cheerful", "self-assured",
      "companionable", "trusting", "watchful", "active", "vivacious", "steadfast",
      "spirited", "good-natured", "unflappable", "capable", "eager", "resilient",
      "respectful", "hardworking", "fun-loving", "majestic", "versatile", "expressive",
      "carefree", "docile", "receptive", "bright", "sun-loving", "robust", "warmhearted",
      "benevolent", "keen", "cooperative", "charming", "dutiful", "meticulous", "comical",
      "impish", "jaunty", "sprightly", "valiant", "gentlemanly", "stately"
    ] # Your expanded list of adjectives
    behaviors = [  "loves to play fetch", "enjoys cuddling with humans", "can't stop chasing its tail",
      "prefers to nap in the sun", "is always sniffing around", "stands by its owner's side",
      "guards the house diligently", "makes friends with everyone", "treats children with care",
      "learns new tricks quickly", "barks at squirrels", "digs holes in the yard", "howls along with music",
      "is wary of strangers", "hides when it rains", "jumps over obstacles", "runs in circles",
      "chews on shoes", "steals socks", "looks out the window", "enjoys long walks", "plays in the water",
      "is gentle with kittens", "takes treats gently", "has a strong sense of smell", "can leap high fences",
      "snores loudly", "loves belly rubs", "is fascinated by birds", "has boundless energy",
      "sits on command", "shakes paws", "rolls over", "enjoys car rides", "is afraid of the vacuum",
      "loves snow", "chases after balls", "is a great watchdog", "adores attention", "is food motivated",
      "likes to be brushed", "is stubborn at times", "has a loud bark", "loves to dig", "is an escape artist",
      "is a lap dog", "enjoys chasing its shadow", "has a favorite toy", "is great at catching frisbees",
      "likes to herd", "is always ready to play", "enjoys agility courses", "is a fast runner",
      "has a calming presence", "can be mischievous", "is very vocal", "has a goofy side", "loves to explore",
      "is excellent at fetching", "enjoys tug-of-war", "is a strong swimmer", "loves to go hiking",
      "is good with other dogs", "likes to people watch", "takes up the whole bed", "loves to give kisses"
    ]  # Your expanded list of behaviors

    unique_combinations = Set.new
    sentences = []

    while sentences.size < 70
      adjectives_sample = adjectives.sample(2) # Select two unique adjectives
      behaviors_sample = behaviors.sample(2)  # Select two unique behaviors
      combination = [adjectives_sample, behaviors_sample]

      unless unique_combinations.include?(combination)
        unique_combinations.add(combination)
        sentences << "Dog #{sentences.size + 1} is #{adjectives_sample.join(' and ')} and #{behaviors_sample.join(', also ')}."
      end
    end

    return sentences
  end
end
