## Ruby RPS
## not sure about placement of these, or class order if I put them in Weapon
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
	
	def zeroPlayerWeapon
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

	def playerWepArray
		return [@weaponHsh:beatsR, @weaponHsh:beatsP, @weaponHsh:beatsS]
	end

	def getName()
		print "What is your name? : "
		@name = gets.chomp().capitalize
	end

	def getWeapon()
		print @name+ ", Choose your weapon: (Rock, Paper, or Scissors) : "
		@weapon = gets.chomp().downcase
	end

	def addWin()
		@score += 1
	end

	def setWeaponHash(playerWepStr, i)

	end

	def checkWeaponHash   ## TODO : this function clearly does two things, so I need to split it up. 
		i = 0 
		while i < 3       
     		if @weapon == "rock" || @weapon == "paper" || @weapon == "scissors"  ## checks if the gets.chomp string a weapon
     			@weaponHsh = $weaponHashCollection[i] ## iterates on [i] in order to add the correct hash weapon
     			break
     		elsif @weapon == ("gun"||"brick"||"dragon"||"chainsaw")
     			puts "Creative.. but no.. try again"
     			i = 0
     			getWeapon()
     		else
     			puts "This is not a valid option for Ro-Sham-Bo.  Try Again"
     			i = 0
     			getWeapon()
     		end
     		i += 1
     	end
		
	end

end

def playAgain()
	puts "Well then... Would you like to play again? Y/N"
	userYorN = gets.chomp
 	if (userYorN == "yes"||userYorN == "y")
 		puts "LETS DO IT!"
     		##insert code to start program over
   	else
     	puts"Bye, you cowards!"
    end
end

def roShamBo(xPlayer, yPlayer)  ## taking player class objects
	compareWep = [0,0,0]

	if (xPlayer.weapon == yPlayer.weapon)
		console.log("Tie");
		playAgain() # still need this function
	end

	# for(var i=0; i <compareWep.length;i++) {
	# 	compareWep[i] = xPlayer[0][i] + yPlayer[0][i];
	# }
 # 	for(var i=0; i<3; i++) {
 # 		if (compareWep[i] == 0) {
	# 		if (xPlayer[i] == weaponCollection[i[3]]) {
	# 			displayWinner(yPlayer, weaponCollection[i][3]);
	# 			return(xPlayer[0])
	# 		}
	# 		else {
	# 			displayWinner(xPlayer, weaponCollection[i][3]);
	# 			return(yPlayer[0])
	# 		}
	# 	}
	# }

end




## STARTING GAME
player1 = Player.new
print "HARK! Player number one! "
player1.getName
player2 = Player.new
print "EGADS! Player number two... "
player2.getName
player1.getWeapon
player1.checkWeaponHash
puts player1.name + " has chosen the " + player1.weapon
player2.getWeapon
player2.checkWeaponHash
puts player2.name + " has chosen the " + player2.weapon




## TEST FOR Player.getName  seems trivial to test, but what the heck
def getNameTEST(string)
	#puts "What is your name? : "
	name = string
	return (name)
end

puts "Test for Player.getName is " + "#{getNameTEST("Brian") == "Brian"}"
puts "Test for Player.getName is " + "#{getNameTEST("Conquessha") == "Conquessha"}"
puts "Test for Player.getName is " + "#{getNameTEST("12") == "12"}"
puts "Test for Player.getName is " + "#{getNameTEST("AOFIJASEOIflkjnffoiauw") == "AOFIJASEOIflkjnffoiauw"}"




