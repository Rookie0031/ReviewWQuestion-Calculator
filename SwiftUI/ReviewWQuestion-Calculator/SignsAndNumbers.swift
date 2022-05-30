import Foundation

enum MainCalculation: String, CaseIterable {
    case division = "÷"
    case multiplication = "x"
    case subtraction = "-"
    case addition = "+"
    case result = "="
}

enum SubCalculation: String, CaseIterable {
    case division = "C"
    case multiplication = "+/-"
    case subtraction = "%"
}

enum Numbers : Int, CaseIterable {
    case seven = 7
    case eight = 8
    case nine = 9
    case four = 4
    case five  = 5
    case six = 6
    case one = 1
    case two = 2
    case three = 3
    
}
