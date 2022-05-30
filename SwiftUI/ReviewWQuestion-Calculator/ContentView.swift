
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var result : CalculationData
    let columns = Array(repeating: GridItem(.fixed(82)), count: 3)
    var body: some View {
        
        GeometryReader { geo in
            VStack(alignment: .trailing){
                Text(result.displayData.count != 0 ? result.isMinus == true ? "-\(result.displayData)" : result.displayData : "0")
                    .padding()
                    .font(.system(size: 60).bold())
                HStack {
                    VStack{
                        HStack {
                            ForEach(SubCalculation.allCases, id:\.self){ sign in
                                SubCalculationButton(sign: sign.rawValue)
                            }
                        }
                        // 숫자별 버튼을 따로 사용하기 위해서 중간에 Grid형태를 넣음
                        LazyVGrid(columns: columns){
                            ForEach(Numbers.allCases, id:\.self){ number in
                                NumberButton(number: number.rawValue)
                            }
                        }
                        HStack{
                            ZeroButton()
                            DotButton()
                        }
                    }
                    VStack{
                        ForEach(MainCalculation.allCases, id:\.self){ sign in
                            MainCalculationButton(sign: sign.rawValue)
                        }
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CalculationData())
    }
}
