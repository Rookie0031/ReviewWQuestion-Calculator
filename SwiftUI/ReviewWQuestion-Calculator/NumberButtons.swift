
import SwiftUI

struct NumberButton: View {
    @EnvironmentObject var buttonInput : CalculationData
    var number : Int
    var body: some View {
        
        Button(action: {
            // 연산자를 누른 이후, 연산 수행을 위한 추가 숫자를 누르는 경우, display 스트링을 초기화 시키고 다시 isReceived을 false로 바꿈 
            if buttonInput.isReceived == true {
                buttonInput.displayData = ""
                buttonInput.isReceived.toggle()
            }
            buttonInput.displayData.append(String(number))
        }){
        Text("\(number)")
            .font(.system(size: 30).bold())
            .foregroundColor(.white)
            .frame(width: 80, height: 80, alignment: .center)
            .background(Circle().fill(.gray))
        }
    }
}

struct ZeroButton: View {
    var body: some View {
        Button(action: {}){
        Text("0")
            .padding(.leading, 30)
            .font(.system(size: 30).bold())
            .foregroundColor(.white)
            .frame(width: 174, height: 80, alignment: .leading)
            .background(.gray)
            .cornerRadius(40)
        }
    }
}

struct DotButton: View {
    var body: some View {
        Button(action: {}){
        Text(".")
            .font(.system(size: 30).bold())
            .foregroundColor(.white)
            .frame(width: 80, height: 80, alignment: .center)
            .background(Circle().fill(.gray))
        }
    }
}

//struct NumberButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NumberButton(number: "1")
//    }
//}
