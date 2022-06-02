
import SwiftUI

struct SubCalculationButton: View {
    @EnvironmentObject var result : CalculationData
    var sign : String
    var body: some View {
        Button(action: {
            if sign == "C" || sign == "AC" {
                result.displayData = ""
                result.buttonIndex = ""
                
            } else if sign == "+/-" {
                // 만약 최종 결과가 음수면 abs처리하고
                // 최종결과가 양수면 음수처리해라 , 근데 finaldata는 double이고 display는 string이다.
                //                result.finalData = abs(result.finalData)
                //                result.displayData = String(result.finalData)
                if Double(result.displayData) ?? 0 < 0 {
                    //                    abs(Double(result.displayData) ?? 0)
                } else {
                    result.isMinus.toggle()
                    //                result.isMinus.toggle()
                }
            } else {
                result.displayData = String(division(Double(result.displayData) ?? 0, 100))
            }
        }){
            Text(sign)
                .font(.system(size: 30).bold())
                .foregroundColor(.black)
                .frame(width: 80, height: 80, alignment: .center)
                .background(Circle().fill(Color.subCalButtonColor))
        }
    }
}

struct DotButton: View {
    @EnvironmentObject var result : CalculationData
    var body: some View {
        Button(action: {
            if result.displayData.contains(".") == false {
                result.displayData.append(".")
            }
        }){
            Text(".")
                .font(.system(size: 30).bold())
                .foregroundColor(.white)
                .frame(width: 80, height: 80, alignment: .center)
                .background(Circle().fill(Color.numberButtonColor))
        }
    }
}


struct DetailFunctionButton_Previews: PreviewProvider {
    static var previews: some View {
        SubCalculationButton(sign: "T")
    }
}
