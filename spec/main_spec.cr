require "../src/helpers/random_string.cr"
require "spec"

describe "random_string" do
  it "generates a random string of 10 chars" do
    random_string(10).size.should eq 10
  end
end
