class C
end

class B < C
end

class A < B
end

a = A.new()
b = B.new()

puts "a. b.respond_to?('class') = " + b.respond_to?('class').to_s
#puts "b. a.superclass == b.class = "+ (a.superclass == b.class).to_s
puts "c. A.superclass == B = "      + (A.superclass == B).to_s
puts "d. a.class.ancestors.include?(C) = " +(a.class.ancestors.include?(C)).to_s
