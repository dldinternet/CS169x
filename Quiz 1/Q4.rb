
movies = [%q{"Aladdin",   "G"},
%q{"I, Robot", "PG-13"},
%q{"Star Wars","PG"}]

#regexp = /"(.*)",\s*"(.*)"/
regexp = /"([^"]+)",\s*"([^"]+)"/

movies.each do |movie|
      movie.match(regexp)
      title,rating = $1,$2
      puts "[#{title}] [#{rating}]"
end
