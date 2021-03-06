#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

my_songs = {
 "Go Go GO" => '/Users/simba/Development/labs/jukebox-cli/audio/Emerald-Park/01.mp3',
 "LiberTeens" => '/Users/simba/Development/labs/jukebox-cli/audio/Emerald-Park/02.mp3',
 "Hamburg" =>  '/Users/simba/Development/labs/jukebox-cli/audio/Emerald-Park/03.mp3',
 "Guiding Light" => '/Users/simba/Development/labs/jukebox-cli/audio/Emerald-Park/04.mp3',
 "Wolf" => '/Users/simba/Development/labs/jukebox-cli/audio/Emerald-Park/05.mp3',
 "Blue" => '/Users/simba/Development/labs/jukebox-cli/audio/Emerald-Park/06.mp3',
 "Graduation Failed" => '/Users/simba/Development/labs/jukebox-cli/audio/Emerald-Park/07.mp3'
}

def help
  #this method should be the same as in jukebox.rb
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  track = 0
  my_songs.each do |k, v|
    track += 1
    puts "#{track}. #{k}"
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash

  puts 'Please enter a song name'
  ans = gets.chomp

  my_songs.each do |k, v|
    if k == ans
      #cmd = "open '#{v}'"
      #`#{cmd}`
      # can also do the above instead
      system "open #{v}"
    else
      "Your song choice is invalid"
    end
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help

=begin
  loop do
    puts "Please enter a command:"
    ans = gets.chomp
    if ans == 'exit'
      exit_jukebox
      break
    elsif ans == 'list'
      list(songs)
    elsif ans == 'play'
      play(songs)
    elsif ans == 'help'
      help
    end
  end
=end

  loop do
    puts "Please enter a command:"
    ans = gets.chomp
    case ans
    when 'exit'
      exit_jukebox
      break
    when 'list'
      list(songs)
    when 'help'
      help
    when 'play'
      play(songs)
    end
  end


end
