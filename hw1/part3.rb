def combine_anagrams(words)
  words.group_by {|i| i.downcase.chars.sort.join}.values
end

#a = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
#p combine_anagrams(a)
