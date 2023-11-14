//
//  MovieView.swift
//  SeSACSwiftUI
//
//  Created by 홍수만 on 2023/11/14.
//

import SwiftUI

struct MovieView: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack {
//            Color.green
            Image(.dummy)
                .resizable()
                .scaledToFill()
//                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
            
            Image(.dummy)
                .resizable()
                .frame(width: 100, height: 100)
                .border(.tint, width: 10)
            
//            VStack {
//                Spacer()
//                
//                Image(.dummy)
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                .border(.tint, width: 10)
//                
//                Spacer()
//                
//                HStack {
//                    Image(.dummy)
//                        .resizable()
//                        .frame(width: 100, height: 100)
//                        .border(.yellow, width: 5)
//                    
//                    Image(.dummy)
//                        .resizable()
//                        .frame(width: 100, height: 100)
//                        .border(.yellow, width: 5)
//
//                    Image(.dummy)
//                        .resizable()
//                        .frame(width: 100, height: 100)
//                        .border(.yellow, width: 5)
//                    
//                }
//            }
            
            Text("zzz")
            
            VStack {
                Button("Show") {
                    isPresented = true
                }
                .padding()
                
                Spacer()
                
                HStack{
                    Circle()
                    Circle()
                    Circle()
                }
            }
        }
        .sheet(isPresented: $isPresented, content: {
            TamagochiView()
        })
//        .fullScreenCover(isPresented: $isPresented, content: {
//            TamagochiView()
//        })
    }
}

#Preview {
    MovieView()
}
