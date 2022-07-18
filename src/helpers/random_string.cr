# Generates a random string of a given length.
def random_string(len : Int, chars : Array(Char))
  String.build do |sb|
    len.times do
      sb << chars.sample(Random::Secure)
    end
  end
end
