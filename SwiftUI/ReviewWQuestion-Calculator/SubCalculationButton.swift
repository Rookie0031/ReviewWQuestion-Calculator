
import SwiftUI

struct SubCalculationButton: View {
    @EnvironmentObject var result : CalculationData
    var sign : String
    var body: some View {
        Button(action: {
            if sign == "C" {
                result.displayData = ""
            } else if sign == "+/-" {
                result.isMinus.toggle()
            } else {
                result.displayData = String(division(Double(result.displayData)!, 100))
            }
        }){
            Text(sign)
                .font(.system(size: 30).bold())
                .foregroundColor(.black)
                .frame(width: 80, height: 80, alignment: .center)
                .background(Circle().fill(.quaternary))
        }
    }
}

struct DetailFunctionButton_Previews: PreviewProvider {
    static var previews: some View {
        SubCalculationButton(sign: "T")
    }
}

