require 'net/http'

url = "http://www.omdbapi.com/?apikey=fb9cc670"

movie_ids = [
  'tt0120737',
  'tt0167261',
  'tt0167260',
  'tt0133093',
  'tt0234215',
  'tt1375666',
  'tt0816692',
  'tt0482571',
  'tt1136608',
  'tt0903624',
  'tt1170358',
  'tt2310332',
  'tt0830515',
  'tt0381061',
  'tt1074638',
  'tt2379713'
]

movie_ids.each do |id|
  response = Net::HTTP.get_response(URI(url + "&i=#{id}&plot=full"))
  data = JSON.parse(response.body)
  movie = Movie.find_or_create_by(imdb_id: data['imdbID'])
  production_house = ProductionHouse.find_or_create_by(name: data["Production"])

  movie.update_attributes(
    title: data['Title'],
    plot: data['Plot'],
    year: data['Year'],
    rated: data['Rated'],
    director: data['Director'],
    released_at: Date.parse(data['Released']),
    runtime: data['Runtime'].to_i * 60,
    awards: data['Awards'],
    poster_url: data['Poster'],
    metascore: data['Metascore'],
    imdb_rating: data['imdbRating'],
    imdb_votes: data['imdbVotes'],
    gross: data['BoxOffice'],
    website_url: data['Website'],
    production_house: production_house
  )

  data['Actors'].split(',').each do |a|
    actor = Actor.find_or_create_by(full_name: a.strip)
    movie.actors << actor
  end

  data['Genre'].split(',').each do |g|
    genre = Genre.find_or_create_by(name: g.strip)
    movie.genres << genre
  end

  data['Language'].split(',').each do |l|
    language = Language.find_or_create_by(name: l.strip)
    movie.languages << language
  end

  data['Ratings'].each do |rating|
    source = Source.find_or_create_by(name: rating['Source'].strip)
    mr = MovieRating.find_or_create_by(movie_id: movie.id, source_id: source.id)
    mr.update_attribute(:value, rating['Value'])
  end
end
