class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.00 }

  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
  end
end

class String
  def palindrome?()
    self.gsub!(/\s|\W/,"")
    return self.downcase.reverse == self.downcase
  end
end

module Enumerable
  def palindrome?()
    return (self.is_a? Array) ? self.reverse == self : self.to_a.palindrome?
  end
end

#puts " 1/ 0.019 = "+ (1/0.019).to_s
#puts 1.dollar.in(:rupees)
#puts 10.rupees.in(:euro)
#
#puts "foo".palindrome?
#puts "Madam, I'm Adam".palindrome?
#puts [1,2,3,2,1].palindrome?
#puts [1,2,3,4,3,2].palindrome?
