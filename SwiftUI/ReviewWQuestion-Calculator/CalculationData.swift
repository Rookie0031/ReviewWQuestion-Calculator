
import Foundation

final class CalculationData : ObservableObject {
    @Published var displayData : String = "" //항상 계산기에 표기될 숫자
    
    @Published var firstData : Double = 0 //메인계산 버튼을 누를시, 저장되는 데이터
    @Published var temporaryData : Double = 0 // = 버튼을 누르는 순간 계산 함수 호출을 위해 임시로 저장되는 데이터
    @Published var finalData : Double = 0 // 임시 데이터 
    @Published var operation : String = "" // 버튼의 기호를 입력받고, 그 기호별 함수 기능을 호출하기 위해 사용
    
    @Published var isMinus : Bool = false // + - 변환 여부에 대한 불리언, 삼항연산자 조건으로 사용됨
    @Published var isTapped : Bool = false // 버튼의 탭 여부를 판단하기 위한 불리언
    @Published var isReceived : Bool = false // firstdata에 값이 들어잇는지 여부를 판단하는 불리언
    
    
}

func calculations(sign : String, a: Double, b: Double) -> Double {
    var result : Double = 0
    switch sign {
    case "+" :
        result = addition(a, b)
    case "-" :
        result = subtraction(a, b)
    case "x" :
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

func division(_ a : Double, _ b : Double) -> Double{
    return a/b
}


// 5를 선택하면 5가 텍스트에 반영된다/ 

//스트링으로 append되고, 그것을 함수로 붙인다음, 


// 첫번째 결과에서 메인기능의 function을 누르면, 값이 복사되서 중간 클래스에 저장됨 -> 클래스 하나 더 만들기
// 저장된걸 인식하면 버튼에 불이들어오고,그 function에 해당하는 행위를 저장하고 있음 (list형태??)
// 두번째 값을 저장하고, 연산을 수행함
// = 을 누르면 마지막 값이 호출됨
