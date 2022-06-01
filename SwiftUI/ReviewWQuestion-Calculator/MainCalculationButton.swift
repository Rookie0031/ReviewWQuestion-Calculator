
import SwiftUI

struct MainCalculationButton: View {
    @EnvironmentObject var result : CalculationData
    var isTapped : Bool = false
    var sign : String
    var body: some View {
        Button(action: {
            // 버튼누를 시, 해당버튼에 해당하는 인덱스로 sign을 넘김
            result.buttonIndex = sign
            
            if sign == "﹦" {
                result.buttonIndex = ""
                // = 버튼을 누르는순간, 연산을 위해 입력한 값이 temporaryData에 저장됨 (연산수행을 위한 임시저장소)
                // 계산함수를 진행함
                
                result.temporaryData = Double(result.displayData) ?? 0
                // 연산수행을 위해 두번째로 입력받은 값을 Double형으로 바꾸는데, 문자열이 비어있으면 0으로 반환
                
                if result.temporaryData == 0 {
                    result.displayData = result.error.toString()
                }
                else {
                    result.finalData = calculations(sign: result.operation, a: result.firstData, b: result.temporaryData)
                    result.displayData = String(result.finalData)
                }
                result.isReceived = true
                //                result.finalData = result.temporaryData
                result.temporaryData = result.firstData
                
                
            } else {
                // 버튼에 해당하는 연산자를 넘겨줘서 함수가 어떤 연산을 수행할지 알려주게함.
                // 연산자를 누르는 순간, 연산 수행여부를 감지하는 isReceived 불리언 값이 true로 바뀜
                // 연산 수행을 위해 입력받은 숫자를 firstData에 저장함
                result.operation = sign
                result.isReceived = true
                result.firstData = Double(result.displayData) ?? 0
                
            }
            
        }
        ){
            Text(sign)
                .font(.system(size: 30).bold())
                .foregroundColor(result.buttonIndex == sign ? .mainCalButtonColor : .white)
                .frame(width: 80, height: 80, alignment: .center)
                .background(Circle().fill(result.buttonIndex == sign ? .white : .mainCalButtonColor))
        }
    }
}

// 빈 스트링일 떄 메인연산 수행시 에러 발생 왜 그럴까?
