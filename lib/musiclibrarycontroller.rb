require 'pry'
class MusicLibraryController

attr_accessor :path, :imported_music
  def initialize(path = './db/mp3s')
    #@path = path
    music_importer = MusicImporter.new(path)
    @imported_music = music_importer.import
    #binding.pry
  end

  def call
    user_input = ''
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    until user_input == 'exit'
      user_input = gets
    end
  end

  def list_songs

    song_list = Song.all.sort_by!{|song| song.name}
    song_list.each_with_index do |song,index|
      puts"#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artist_list = Artist.all.sort_by{|artist| artist.name}
    artist_list.each_with_index do |artist,index|
      puts"#{index +1}. #{artist.name}"
    end
  end

  def list_genres
    genre_list = Genre.all.sort_by{|genre| genre.name}
    genre_list.each_with_index do |genre,index|
      puts"#{index +1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    song_list_by_artist = Song.all.sort_by!{|song| song.name}
    #binding.pry
    count = 1
    song_list_by_artist.each do |song|
      if song.artist.name == artist
        puts "#{count}. #{song.name} - #{song.genre.name}"
        count += 1
      end
    end
  end

end
