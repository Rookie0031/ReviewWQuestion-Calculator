
import SwiftUI

struct NumberButton: View {
    @EnvironmentObject var buttonInput : CalculationData
    var number : Int
    var body: some View {
        
        Button(action: {
            // 연산자를 누른 이후, 연산 수행을 위한 추가 숫자를 누르는 경우, display 스트링을 초기화 시키고 다시 isReceived을 false로 바꿈
            if buttonInput.isReceived == true || buttonInput.displayData == buttonInput.error.toString()  {
                buttonInput.displayData = ""
                buttonInput.isReceived.toggle()
            }
            buttonInput.displayData.append(String(number))
        }){
            Text("\(number)")
                .font(.system(size: 30).bold())
                .foregroundColor(.white)
                .frame(width: 80, height: 80, alignment: .center)
                .background(Circle().fill(Color.numberButtonColor))
        }
    }
}

struct ZeroButton: View {
    @EnvironmentObject var buttonInput : CalculationData
    var body: some View {
        Button(action: {
            
            // 연산수행 버튼이 감지되면, 디스플레이 버튼을 초기화시킴
            if buttonInput.isReceived == true {
                buttonInput.displayData = ""
                buttonInput.isReceived.toggle()
            }
            
            // 맨 처음 0일 때는 0붙여도 아무일도 안일어나지만, 그 뒤에는 열배가 되는 형식
            if buttonInput.displayData.count != 0 {
                buttonInput.displayData.append("0")
            }
        }){
            Text("0")
                .padding(.leading, 30)
                .font(.system(size: 30).bold())
                .foregroundColor(.white)
                .frame(width: 174, height: 80, alignment: .leading)
                .background(Color.numberButtonColor)
                .cornerRadius(40)
        }
    }
}

//struct NumberButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NumberButton(number: "1")
//    }
//}
