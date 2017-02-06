require 'pry'
$rock = {:beatsR => 0,:beatsP => 0,:beatsS => 1,:name => "rock"}
$paper = {:beatsR => 1,:beatsP => 0,:beatsS => 0,:name => "paper"}
$scissors = {:beatsR => 0,:beatsP => 1,:beatsS => 0,:name => "scissors"}

$weaponHashCollection = [$rock, $paper, $scissors]

class Player
		@name = ""
		@weapon = ""
		@weaponHsh = {} 
		@score = 0
	
	def initializePlayer
		@name = ""
		@weapon = ""
		@weaponHsh = {}
		@score = 0
	end

	def resetPlayerWeapon
		@weapon = ""
		@weaponHsh = {}
	end

	def name
		return @name
	end

	def weapon
		return @weapon
	end

	def score
		return @score
	end

	def weaponHsh
		return @weaponHsh
	end

	def addWin
		@score += 1
	end

	def playerWepArray  # defining this helps us do the roShamBo(comparing) later
		return [@weaponHsh[:beatsR], @weaponHsh[:beatsP], @weaponHsh[:beatsS]]
	end

	def getName
		print "What is your name? : "
		@name = gets.chomp().capitalize
	end

	def setWepAndNameAndHash_fromPost(nameQ,wepQ) #specific to web app
		@name = nameQ.capitalize
		@weapon = wepQ
		setWeaponHash
	end

	def confirmUserWeaponLegit  ## this needs to be refactored??
		print @name+ ", Choose your weapon: (Rock, Paper, or Scissors) : "
		userStr = gets.chomp()
		if ["rock","paper","scissors"].include?(userStr)
			@weapon = userStr
			return @weapon
		elsif ["gun","brick","dragon","chainsaw","garbage truck", "knife", "hammer"].include?(userStr)
			puts "Creative.. but no.. try again"
			confirmUserWeaponLegit
		else 
			puts "not a valid input for RPS. Try Again."
			confirmUserWeaponLegit
		end

	end

	def setWeaponHash
		if @weapon == "rock"
			@weaponHsh = $rock
		elsif @weapon == "paper"
			@weaponHsh = $paper
		else @weapon == "scissors"
			@weaponHsh = $scissors
		end
	end

	def setAllWepAndConfirm
		confirmUserWeaponLegit
		setWeaponHash
		puts @name + " has chosen the " + @weapon
	end
end  ##end of Player class definition, perhaps this should be a player and a weapon?





def playAgain(xPlayer, yPlayer)
	puts "Well then... #{xPlayer.name} and #{yPlayer.name} Would you like to play again? Y/N"  # I could use same names if functions were well seperated, then get new names if they wanted friends to play
	userYorN = gets.chomp
 	if (userYorN == "yes"||userYorN == "y")
 		puts "LETS DO IT!"
     		## need to flesh this out, reset values etc
   	else
     	puts"Bye!"
    end
end

def whoWon(xPlayer, yPlayer, int)
	if xPlayer.weaponHsh == $weaponHashCollection[int]
		#puts "Player #{xPlayer.name} wins with the magnificent #{xPlayer.weapon}!!"		
		return xPlayer
	elsif yPlayer.weaponHsh == $weaponHashCollection[int]
		#puts "Player #{yPlayer.name} wins with the magnificent #{yPlayer.weapon}!!"
		return yPlayer
	end
end

def playerTie(xPlayer,yPlayer)
	if xPlayer.weapon == yPlayer.weapon
		return true
	else
		return false
	end
end


def roShamBo(xPlayer, yPlayer)
	wepArr = weaponsClash(xPlayer, yPlayer) # compare weapons: add them: [0,1,1] rock wins [1,0,1] scissors wins etc
		if playerTie(xPlayer,yPlayer) == true
			return nil
		elsif wepArr.index(0) == 0  ## if the index is 0, person holding this weapon won
			return whoWon(xPlayer, yPlayer, 0)
		elsif wepArr.index(0) == 1
			return whoWon(xPlayer, yPlayer, 1)
		else
			return whoWon(xPlayer, yPlayer, 2)
		end
 end

def weaponsClash(xPlayer, yPlayer)
	i = 0
	compareWepArr = [0,0,0]
	while i<2 do
		compareWepArr[i] = xPlayer.playerWepArray[i] + yPlayer.playerWepArray[i]
		i+=1
	end
	return compareWepArr
end

def whoWonSet(player1, player2)
	if player1.score > 2
		puts "#{player1.name} is triumphant, with a total #{player1.score} wins!"
		return (true)
	elsif player2.score > 2
		puts "#{player2.name} is triumphant, with a total #{player2.score} wins!"
		return(true)
	end
end

def bestOfFive(player1,player2)
	if player1.score < 3 && player2.score < 3
		puts "Best 3 out of 5?"
		puts "#{player1.name} has #{player1.score} wins, and #{player2.name} has #{player2.score} wins!"
		newGameSamePlayers(player1,player2)
	else
		whoWonSet(player1,player2)
	end
end


def isScoreAboveThree(player1,player2)  ## developed for easier web compatibility 
	if player1.score < 3 && player2.score < 3
		return false
	else
		return true
	end
end

def newGameSamePlayers(player1,player2)
	player1.resetPlayerWeapon
	player2.resetPlayerWeapon

	player1.setAllWepAndConfirm
	player2.setAllWepAndConfirm

	roShamBo(player1,player2)
	bestOfFive(player1,player2)
end

def newGame
	player1 = Player.new
	player2 = Player.new

	player1.initializePlayer
	player2.initializePlayer

	print "HARK! Player number one! "
	player1.getName
	print "EGADS! Player number two... "
	player2.getName

	player1.setAllWepAndConfirm
	player2.setAllWepAndConfirm

	roShamBo(player1,player2).addWin

	bestOfFive(player1,player2) #recursive function that calls newGameSamePlayers which calls bestofFive and exits once 3 wins are had
end

# newGame



## TEST FOR Player.getName  seems trivial to test, but what the heck
# def getNameTEST(string)
# 	#puts "What is your name? : "
# 	name = string
# 	return (name)
# end

# puts "Test for Player.getName is " + "#{getNameTEST("Brian") == "Brian"}"
# puts "Test for Player.getName is " + "#{getNameTEST("Conquessha") == "Conquessha"}"
# puts "Test for Player.getName is " + "#{getNameTEST("12") == "12"}"
# puts "Test for Player.getName is " + "#{getNameTEST("AOFIJASEOIflkjnffoiauw") == "AOFIJASEOIflkjnffoiauw"}"




