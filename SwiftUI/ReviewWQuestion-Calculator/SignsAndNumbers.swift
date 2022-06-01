import Foundation
import SwiftUI

var displayData = CalculationData().displayData

func clearString() -> String {
    var clearString : String = ""
    if displayData.count > 0 {
        clearString = "AC"
    } else {
        clearString = "C"
    }
    return clearString
}

enum MainCalculation: String, CaseIterable {
    case division = "÷"
    case multiplication = "×"
    case subtraction = "-"
    case addition = "+"
    case result = "﹦"
}

enum SubCalculationCase: String, CaseIterable {
    // 디스플레이 텍스트 여부에 따라서 AC 로 바꾸고 싶은데 enum 내부에서 처리할 수 있는 방법은?
    case clear = "C"
    case plusMinus = "+/-"
    case percentage = "%"
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

