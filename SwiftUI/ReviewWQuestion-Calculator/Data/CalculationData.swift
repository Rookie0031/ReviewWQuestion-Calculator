
import Foundation
import SwiftUI

// 앱 실행시 실시간으로 변경되는 데이터를 관리하기 위해 ObservabeObject 프로토콜을 채택함
// 한곳에서 필요변수를 선언하고, 각 struct에서 가져다쓰는 구조로 만듬


final class CalculationData : ObservableObject {
    @Published var displayData : String = "" //항상 계산기에 표기될 스트링
    @Published var firstData : Double = 0 //메인계산 버튼을 누를시, 저장되는 데이터
    @Published var temporaryData : Double = 0 // = 버튼을 누르는 순간 계산 함수 호출을 위해 임시로 저장되는 데이터
    @Published var finalData : Double = 0 // 최종 디스플레이될 문자열
    @Published var operation : String = "" // 버튼의 기호를 입력받고, 그 기호별 함수 기능을 호출하기 위해 사용
    @Published var isMinus : Bool = false // + - 변환 여부에 대한 불리언, 삼항연산자 조건으로 사용됨
    @Published var isTapped : Bool = false // 버튼의 탭 여부를 판단하기 위한 불리언
    @Published var isReceived : Bool = false // firstdata에 값이 들어잇는지 여부를 판단하는 불리언
    @Published var buttonIndex : String = "" // 사칙연산 버튼 클릭시, 해당 버튼의 색상변화를 위해 사용되는 인덱스
    let error : LocalizedStringKey = "error" // 에러 표기를 위한 스트링, localizedStringkey사용으로 휴대폰에서 지정한 언어로 바뀜
    
}

// 최종 계산 함수 
func calculations(sign : String, a: Double, b: Double) -> Double {
    var result : Double = 0
    switch sign {
    case "+" :
        result = addition(a, b)
    case "-" :
        result = subtraction(a, b)
    case "×" :
        result = multiplication(a, b)
    case "÷" :
        result = division(a, b)
        
    default :
        print("Nothing")
    }
    
    return result
    
}

func addition(_ a : Double, _ b : Double) -> Double {
    return a+b
}

func subtraction(_ a : Double, _ b : Double) -> Double {
    return a-b
}

func multiplication(_ a : Double, _ b : Double) -> Double {
    return a*b
}

func division(_ a : Double, _ b : Double) -> Double {
    return round(( (a/b) * 100 )) / 100
}

