if (scrCheckFloorClear() = true) {active = true} else {active = false}

if active = true {imgSpd += 0.5;} else {imgSpd = 0;}
bobAmt = Wave(-goFact, -16-goFact, 2, 0) //sine wave issue? Can't have the arrow start moving FROM an initial position? Or just don't worry about it