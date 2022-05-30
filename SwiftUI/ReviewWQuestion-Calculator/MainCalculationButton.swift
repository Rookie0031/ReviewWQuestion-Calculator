
import SwiftUI

struct MainCalculationButton: View {
    @EnvironmentObject var result : CalculationData
    var isTapped : Bool = false
    var sign : String
    var body: some View {
        Button(action: {
            
            if sign == "=" {
                // = 버튼을 누르는순간, 연산을 위해 입력한 값이 temporaryData에 저장됨 (연산수행을 위한 임시저장소)
                result.temporaryData = Double(result.displayData)!
                result.finalData = calculations(sign: result.operation, a: result.firstData, b: result.temporaryData)
                result.displayData = String(result.finalData)
            } else {
                // 버튼에 해당하는 연산자를 넘겨줘서 함수가 어떤 연산을 수행할지 알려주게함.
                // 연산자를 누르는 순간, 연산 수행여부를 감지하는 isReceived 불리언 값이 true로 바뀜
                // 연산 수행을 위해 입력받은 숫자를 firstData에 저장함
                result.operation = sign
                result.isReceived.toggle()
                result.firstData = Double(result.displayData)!
            }
            
        }
        ){
            Text(sign)
                .font(.system(size: 30).bold())
                .foregroundColor(isTapped == true ? .orange : .white)
                .frame(width: 80, height: 80, alignment: .center)
                .background(Circle().fill(isTapped == true ? .white : .orange))
        }
    }
}

