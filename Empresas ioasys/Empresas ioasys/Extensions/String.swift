import Foundation

extension String {
    func removeDetails() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }
    
    func isNumbersOnly() -> Bool {
         var isNumbersOnly = true
         
         self.forEach { character in
             if !character.isNumber {
                 isNumbersOnly = false
                 return
             }
         }
         return isNumbersOnly
     }
    
    func isLettersOnly() -> Bool {
        var isLettersOnly = true
        
        self.forEach { character in
            if !character.isLetter {
                isLettersOnly = false
                return
            }
        }
        return isLettersOnly
    }
    
    func hasNumbers() -> Bool {
        var hasNumbers = false
        
        self.forEach { character in
            if character.isNumber {
                hasNumbers = true
                return
            }
        }
        return hasNumbers
    }
    
    func hasLetters() -> Bool {
        var hasLetters = false
        
        self.forEach { character in
            if character.isLetter {
                hasLetters = true
                return
            }
        }
        return hasLetters
    }
    
    func splitLetters() -> String {
        var letters = ""
        self.forEach { character in
            if character.isLetter {
                letters += String(character)
            }
        }
        return letters
    }
    
    func splitNumbers() -> String {
        var numbers = ""
        self.forEach { character in
            if character.isNumber {
                numbers += String(character)
            }
        }
        return numbers
    }
    
    
}
