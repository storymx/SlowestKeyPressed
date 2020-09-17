func slowestKey(keyTimes: [[Int]]) -> Character {
    let n = keyTimes.count
    let columns = 2

    // upperBound Constraint
    let firstUpperBound = 2 * Int(pow(Double(10), Double(5)))
    let upperLimit = 2 * Int(pow(Double(10), Double(8)))

    //time difference
    var td = Int()
    //previous time difference
    var ptd = Int()
    //Time Difference Index
    var tdIndex = Int()
    //1.- Define Characters Array with their custom codes
    let asciiDict: [Int: Character] = [0:"a", 1: "b", 2: "c", 3: "d", 4: "e", 5: "f",6: "g",7: "h",8: "i",9: "j",10: "k", 11: "l", 12: "m", 13: "n", 14: "o", 15: "p", 16: "q", 17: "r", 18: "s", 19: "t", 20: "u", 21: "v", 22: "w", 23: "x", 24: "y", 25: "z"]
    // define result variable
    var character: Character = asciiDict[keyTimes[0][0]]!
    //2.- Create an Array that contains the sustractions
    for i in 0..<n {
        if n <= firstUpperBound && (0 <= keyTimes[i][0] && keyTimes[i][0] <= 25) && (1 <= keyTimes[i][1] && keyTimes[i][1] <= upperLimit) {
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
        }

        //this is a debug print inorder to see th actual log operation for this solution
        print("ptd: \(ptd) at Index: \(tdIndex) and actual TD is: \(td) for character: \(character)")
    }

    return character

}

slowestKey(keyTimes: [[0,2], [3,10], [1,22], [7,1]])