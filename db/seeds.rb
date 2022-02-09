# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Movie.create(title: 'Wonder Woman 1984', overview: 'Wonder Woman comes into conflict with the Soviet Union during the
#   Cold War in the 1980s',
#              poster_url: 'https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg', rating: 6.9)
# Movie.create(title: 'The Shawshank Redemption', overview: 'Framed in the 1940s for double murder, upstanding banker Andy
#   Dufresne begins a new life at the Shawshank prison',
#              poster_url: 'https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg', rating: 8.7)
# Movie.create(title: 'Titanic', overview: '101-year-old Rose DeWitt Bukater tells the story of her life aboard the
#   Titanic.',
#              poster_url: 'https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg', rating: 7.9)
# Movie.create(title: 'Ocean\'s Eight', overview: 'Debbie Ocean, a criminal mastermind, gathers a crew of female thieves
#   to pull off the heist of the century.', poster_url: 'https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg',
#              rating: 7.0)
# Movie.create(title: 'No Time to Die', overview: 'Bond has left active service and is enjoying a tranquil life in Jamaica.
#   His peace is short-lived when his old friend Felix Leiter from the CIA turns up asking for help. The mission to rescue
#   a kidnapped scientist turns out to be far more treacherous than expected, leading Bond onto the trail of a mysterious
#   villain armed with dangerous new technology.', poster_url: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/iUgygt3fscRoKWCV1d0C7FbM9TP.jpg',
#              rating: 7.5)
# Movie.create(title: 'A Bronx Tale', overview: 'Set in the Bronx during the tumultuous 1960s, an adolescent boy is torn
#   between his honest, working-class father and a violent yet charismatic crime boss. Complicating matters is the youngster\'s
#   growing attraction - forbidden in his neighborhood - for a beautiful black girl.',
#              poster_url: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sDbO6LmLYtyqAoFTPpRcMgPSCEO.jpg',
#              rating: 7.7)
# Movie.create(title: 'Space Jam', overview: 'Jokes fly as the Tune Squad takes on the Nerdlucks in a hardcourt game to
#   decide if the Looney Tunes remain here... or become attractions at a far-off galactic off-ramp called Moron Mountain.
#   The Nerdlucks have a monstrous secret weapon: they\'ve stolen the skills of top NBA stars like Charles Barkley and
#   Patrick Ewing and become Monstars. But that\'s not all, folks. The Tune Squad’s secret weapon just happens to be the
#   finest player in this or any other universe. He\'s outta this world. So\'s the fun.',
#              poster_url: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/4RN5El3Pj2W4gpwgiAGLVfSJv2g.jpg',
#              rating: 6.9)
# Movie.create(title: 'Spider-Man: Homecoming', overview: 'Following the events of Captain America: Civil War, Peter Parker,
#   with the help of his mentor Tony Stark, tries to balance his life as an ordinary high school student in Queens, New York
#   City, with fighting crime as his superhero alter ego Spider-Man as a new threat, the Vulture, emerges.',
#              poster_url: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/c24sv2weTHPsmDa7jEMN0m2P3RT.jpg',
#              rating: 7.4)
# Movie.create(title: 'Guardians of the Galaxy', overview: 'Light years from Earth, 26 years after being abducted, Peter
#   Quill finds himself the prime target of a manhunt after discovering an orb wanted by Ronan the Accuser.',
#              poster_url: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/r7vmZjiyZw9rpJMQJdXpjgiCOk9.jpg',
#              rating: 7.9)

require 'json'
require 'open-uri'

def movies_dataset
  url = 'http://tmdb.lewagon.commovie/top_rated'
  movies_serialized = URI.open(url).read
  movies = JSON.parse(movies_serialized)
  movies.each do |m|
  Movie.create(title: m['title'], overview: m['overview'],
               poster_url: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/#{m[poster_path]}",
               rating: m['vote_average'])
  end
end
movies_dataset
