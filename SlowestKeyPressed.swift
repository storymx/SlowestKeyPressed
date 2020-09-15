//========================== Slowest Key Press =========================
func slowestKey(keyTimes: [[Int]]) -> Character {
    // define result variable
    var character: Character = "a"
    //time difference
    var td = Int()
    //previous time difference
    var ptd = Int()
    //Time Difference Index
    var tdIndex = Int()
    //1.- Define Characters Array with their custom codes
    let asciiDict: [Int: Character] = [0:"a", 1: "b", 2: "c", 3: "d", 4: "e", 5: "f",6: "g",7: "h",8: "i",9: "j",10: "k", 11: "l", 12: "m", 13: "n", 14: "o", 15: "p", 16: "q", 17: "r", 18: "s", 19: "t", 20: "u", 21: "v", 22: "w", 23: "x", 24: "y", 25: "z"]
    //2.- Create an Array that contains the sustractions
    for i in 0..<keyTimes.count {
        // if for initial element of the array
        if i == 0 {
            
            tdIndex = i
            ptd = 0
            td = keyTimes[i][1] - ptd
            ptd = td
            character = asciiDict[keyTimes[i][0]]!
            
        } else {
            //for values > 0 of the array

            //we get td in order to compare the  previous ptd
            td = keyTimes[i][1] - keyTimes[i-1][1]
            //if td is greater than the previous td (ptd)
            if td > ptd {
                //the previous time difference is now the timedifference 
                ptd = td
                // we get the index
                tdIndex = i
                //and then we assign the character from the greater previous index
                character = asciiDict[keyTimes[i][0]]!
            }
        }
        print("ptd: \(ptd) at Index: \(tdIndex) and actual TD is: \(td) for character: \(character)")
    }
    
    return character
}

//test the function
print(slowestKey(keyTimes: [[0,2],[1,3],[1,22],[5,7]]))