class Dessert

  attr_accessor :name, :calories
  def initialize(name, calories)
    # YOUR CODE HERE
    @name,@calories=name,calories
  end

  def healthy?
    @calories < 200
  end

  def delicious?
    self.kind_of?  Dessert
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(name, calories, flavor)
    @flavor = flavor
    super(name,calories)
  end

  def delicious?
    @flavor != "black licorice"
  end
end

#dessert1=Dessert.new("icecream",400)
#dessert2=JellyBean.new("icecream",400,"black licorice")
#puts dessert1.delicious?
#puts dessert2.delicious?
