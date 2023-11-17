//
//  RenderView.swift
//  SeSACSwiftUI
//
//  Created by 홍수만 on 2023/11/13.
//

import SwiftUI

struct RenderView: View {
    //시스템에서 정의된 값을 감지하고 뷰를 업데이트 할 수 있음
//    @Environment(\.presentationMode) var presentationMode // deprecated..
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme //Ligth Mode/Dark Mode
    
    @State var age = 10
    
    init(age: Int = 10) {
        self.age = age
        print("RenderView Init")
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow, Color.blue]), startPoint: .bottomLeading, endPoint: .trailing)
                        )
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            RadialGradient(gradient: Gradient(colors: [.yellow, .blue]), center: .bottom, startRadius: 10, endRadius: 50)
                        )
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            AngularGradient(colors: [.yellow, .green], center: .leading, angle: .degrees(200))
                        )
                }
                .frame(width: .infinity, height: 100)
                
                NavigationLink("Push") {
                    MenuView()
                }
                
                Text("Hue: \(age) \(Int.random(in: 1...100))")
                Text("Jack: \(Int.random(in: 1...100))")
                bran
                KokoView()
                Button(colorScheme == .dark ? "다크보드 클릭" : "라이트모드 클릭") {
//                    age = Int.random(in: 1...100)
//                    presentationMode.wrappedValue.dismiss()
                    dismiss.callAsFunction()
                }
                .background(colorScheme == .dark ? .black : .gray)
                .foregroundColor(colorScheme == .dark ? .white : .yellow)
            }
            .navigationTitle("네비게이션 타이틀")
            .navigationBarItems(leading: Text("클릭"))
        }
        
    }
    
    var bran: some View {
        Text("Bran: \(Int.random(in: 1...100))")
    }
}

#Preview {
    RenderView()
}


struct KokoView: View {
    var body: some View {
        Text("Koko: \(Int.random(in: 1...100))")

    }
}
