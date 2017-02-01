var prompt = require('prompt');



class Rps_game {
	constructor(playOneWep, playTwoWep) {
		this.playOneWep = playOneWep; //not sure if this is everything
		this.playTwoWep = playTwoWep;
	}

	set_up_initial_weapons(){
		prompt.start();
		prompt.get(['playerOneWeapon', 'playerTwoWeapon'], function (err, result)  {
  //   	console.log('Weapons Chosen:');
  //   	console.log('  Player1 weapon: ' + result.playerOneWeapon);
  //   	console.log('  Player2 weapon: ' + result.playerTwoWeapon);
		playOneWep = result.playerOneWeapon
		playTwoWep; = result.playerTwoWeapon
		});
	}

	determineWinner(){

	}

}

class RockPaperScissor {
	constructor(rpsTripleVal)

	key value pairs:
 	rock = [1,1,0]
 	paper = [0,1,1]
 	scissor = [1,0,1]

 	function roShamBo(wepOne, wepTwo) {
 		winArray
		for (i = 0; i < 3; i++) {
			wepOne[i] + wepTwo[i]
 		}

 	}
 	

 	//rock + paper = [1,2,1] => paper win
 	//rock + scissor = [2,1,1] => rock win
 	//paper + scissor = [1,1,2] => scissor win
}

//newRps = Rps_game.new;

newRps.promptPlayer1

newRps.promptPlayer2

newRps.displayWinner

