class Tower
  attr_reader :posts

  def initialize(posts = {"A" => [3, 2, 1], "B" => [], "C" => []})
    @posts = posts
  end

  def move!
    posts["C"] << posts["A"].pop
    posts["B"] << posts["A"].pop
    posts["B"] << posts["C"].pop
    posts["C"] << posts["A"].pop
    posts["A"] << posts["B"].pop
    posts["C"] << posts["B"].pop
    posts["C"] << posts["A"].pop
  end
end

t = Tower.new
t.move!
puts t.posts
{"A" => [], "B" => [], "C" => [3, 2, 1]}
