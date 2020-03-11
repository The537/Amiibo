//import SwiftUI
//import Foundation
//import Combine
//
//struct Test: View {
//    @State private var operatorString = ""
//
//    var body: some View {
//        VStack {
//            Subview(operatorValueString: $operatorString)
//            Text("Picker: = \(operatorString)")
//        }
//    }
//}
//
//struct Subview: View {
//    @Binding var operatorValueString: String
//    @State private var queryType: Int = 0
//
//    let operators = ["Figure", "Card", "Yarn"]
//
//    var body: some View {
//
//        let binding = Binding<Int>(
//            get: { self.queryType },
//            set: {
//                self.queryType = $0
//                self.operatorValueString = self.operators[self.queryType]
//            })
//
//        return Picker(selection: binding, label: Text("Query Type")) {
//            ForEach(operators.indices) { index in
//                Text(self.operators[index]).tag(index)
//            }
//        }.pickerStyle(SegmentedPickerStyle())
//    }
//}
//struct Text_Previews: PreviewProvider {
//	static var previews: some View {
//		Test()
//	}
//	
//}
