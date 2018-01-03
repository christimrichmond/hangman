puts "Welcome to H-A-N-G-M-A-N. Guess the word & save a life! \n \n"
puts "Please enter a letter to begin the game. \n \n"

words = File.open('words.txt') #opens the text file with a list of words
tries = 0 #sets number of tries to zero

words_array = words.readline.strip #creates an array of the words to be used and reads the file line by line, instead of reading the entire file,
    #.strip removes extra characters and line breaks from being turned into strings

word_letter = words_array.split(//) #splits word into individual letter strings

user_progress = ["_" * word_letter.length]

#modified lines 15 thru 30 from stack overflow https://stackoverflow.com/questions/31965803/how-to-show-users-correct-guesses-in-hangman-ruby/31966304#31966304
while tries < 6 || word_letter.length == 0 #while tries are less than 6 or the length of the word letter is zero, then...
  input_letter = gets.chomp.downcase.strip #takes user input, makes it lower case & removes excess character input
  if word_letter.include? input_letter #this is a true/false type scenario, if the user letter matches the game letter, proceed, else line 25
    ind = word_letter.index(input_letter) #finds the index value of the first occurence of the user letter
    user_progress.insert(ind, input_letter) #inserts the letter before the index value? *total confusion here*
    user_progress.delete("_") #visually deletes an underscore on the screen if user letter matches game letter
    word_letter.delete(input_letter) #removes the letter guessed correctly from the array of letters
    puts "You guessed one letter! \n \n"
    user_progress = "_ " * word_letter.length #puts an underscore and space for each remaining correct letter
    puts user_progress
  else
    puts "Sorry, please try again. \n \n"
    tries += 1 #the number of tries is equal to 1
    puts "You have " + (6 - tries).to_s + " tries left. \n \n" # prints the number of tries left by subtracting 6 from number of incorrect answers,
          # then converts the integer back into a string
  end

    if tries == word_letter.length #if the number of tries is equal to the length of the letters in the correct word...
      puts "Congratulations! You have saved the man! \n \n G-A-M-E -- O-V-E-R \n \n"
    end
      break if tries == word_letter.length #this ends the program if the word is guessed
  
    if tries == 6
      puts "Sadly, you've killed him. \n \n G-A-M-E - - O-V-E-R \n \n"
    end
      break if tries >= 6 #this ends the program if the amount of tries equals or exceeds 6
end


# notes to self...
# someone please help me fix this! :)
# go back and shuffle words from text file
