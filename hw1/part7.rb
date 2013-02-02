class CartesianProduct
  include Enumerable
  def initialize (a1, a2)
    @arr1,@arr2 = a1,a2
  end
  def each
    @arr1.each do |e1|
      @arr2.each do |e2|
        yield [e1,e2]
      end
    end
  end
end

#c = CartesianProduct.new([:a,:b], [4,5])
#c.each { |elt| puts elt.inspect }
## [:a, 4]
## [:a, 5]
## [:b, 4]
## [:b, 5]
#
#c = CartesianProduct.new([:a,:b], [])
#c.each { |elt| puts elt.inspect }
## Nothing printed since Cartesian product of anything with an empty collection is empty
