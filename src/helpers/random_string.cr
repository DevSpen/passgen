require "../constants.cr"

# Generates a random string of a given length.
def random_string(len : Int)
  String.build do |sb|
    len.times do
      sb << CHARACTERS.sample(Random::Secure)
    end
  end
end
