
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var result : CalculationData
    let columns = Array(repeating: GridItem(.fixed(80)), count: 3)
    
    var body: some View {
        
        ZStack {
            Rectangle().foregroundColor(.black)
                .ignoresSafeArea()
            // 배경색 삽입
            
            // 기기별 사이즈에 따라 비율 유지를 위해 geo를 도입함
            GeometryReader { geo in
                VStack(alignment: .trailing){
                    displayText()
                    
                    HStack {
                        VStack{
                            HStack {
                                ForEach(SubCalculationCase.allCases, id:\.self){ sign in
                                    SubCalculationButton(sign: sign.rawValue)
                                }
                            }
                            // 숫자별 버튼을 따로 관리하기 위해서 Grid형태를 넣음
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
    
    // 디스플레이될 텍스트(숫자)를 반환해주는 함수
    private func displayText() -> some View {
        
        Text(result.displayData.count != 0 ? (result.isMinus == true ? "-\(result.displayData)" : result.displayData) : "0")
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 56).bold())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CalculationData())
    }
}

// 9자리 숫자를 제한하기 위해서 임시로 만든 함수. 제작중...
func textLengthLimit(_ a: String) -> String {
    let index = a.index(a.startIndex, offsetBy: 8)
    return String(a[..<index])
}

