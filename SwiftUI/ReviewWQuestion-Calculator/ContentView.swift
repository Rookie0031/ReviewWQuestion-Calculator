
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var result : CalculationData
    let columns = Array(repeating: GridItem(.fixed(80)), count: 3)
    
    var body: some View {
        
        ZStack {
            Rectangle().foregroundColor(.black)
                .ignoresSafeArea()
            // 배경색
            
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

// if input == sign -> button {
// 

// 최종 연산 결과를 처리해주는 함수를 만들어야겟다
// 1. 숫자 자리가 9자리 이상이면 9자리만 인덱싱해라
// 만약에 인트형이면 인트로 바꿔내라

func textLengthLimit(_ a: String) -> String {
    let index = a.index(a.startIndex, offsetBy: 8)
    return String(a[..<index])
}
