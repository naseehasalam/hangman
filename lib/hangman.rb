words = File.open("google-10000-english-no-swears.txt",mode="r")
content = words.readlines
words_selected=content.map{|word| word if (word.length>5 && word.length<12)}.select!{|word| word if !(word.nil?)}

def select_word(words)
    x=rand(words.length)-1
    selected_word=words[x]
    selected_word
end

def tryletter(word,letter,guess)
    if word.include? letter
        ind=word.index(letter)
        list_guess=guess.split("")
        occurences= (0...word.length).find_all{ |i| word[i]==letter} 
        for i in occurences do
            list_guess[i]=letter
        end
        wordnew=""
        for i in list_guess do
            wordnew<<i
        end
        guess=wordnew
        guess
    else
        guess
    end
end

word=select_word(words_selected)
triesLeft=word.length-1
triesDone=0
guess="_"*(word.length-1)
puts word
puts guess
puts "You have #{triesLeft} number of guesses. All the Best!"

while triesLeft!=0 && guess!=word do
    print("Enter your guess: ")
    letter=gets.chomp.to_s
    guess=tryletter(word,letter,guess)
    triesLeft-=1
    triesDone+=1
    when triesLeft==1
        "This is your last try!!"
    end
    puts guess
    puts "Number of tries Left: #{triesLeft}"
    puts "Number of tries taken: #{triesDone}"
end
puts "You have finished"