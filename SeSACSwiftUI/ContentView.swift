//
//  ContentView.swift
//  SeSACSwiftUI
//
//  Created by 홍수만 on 2023/11/13.
//

import SwiftUI

struct ContentView: View {
    
    let a: Array<String> = Array<String>()
    let b: Array<Int> = [2,3,4]

    var body: some View {
//        Button("클릭하기") {
//            let value = type(of: self.body)
//            print(value)
//        }
//        .foregroundStyle(.yellow)
//        .background(.green)
        
        VStack{
            Text("안녕하세요")
                .foregroundStyle(Color.white)
                .font(.largeTitle)
                .background(Color.black)
                .padding()
                .background(Color.red)
                .border(.green, width: 10)
            //            .border(Color.black)
            //            .foregroundColor(.white)
    
            Text("안녕하세요")
                .foregroundStyle(Color.white)
                .font(.largeTitle)
                .background(Color.black)
                .padding()
                .background(Color.red)
                .border(.green, width: 10)
        }
        
    }
}

#Preview {
    ContentView()
}
