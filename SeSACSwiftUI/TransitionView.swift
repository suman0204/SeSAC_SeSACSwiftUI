//
//  TransitionView.swift
//  SeSACSwiftUI
//
//  Created by 홍수만 on 2023/11/15.
//

import SwiftUI
/*
 버튼을 클릭해서 화면 Dismiss/Pop
 
*/
struct TransitionView: View {
    
    @State private var isFull = false
    @State private var isSheet = false
    
    var body: some View {
        NavigationView{
            HStack(spacing: 20) {
                Button("Full") {
                    isFull.toggle()
                }
                Button("Sheet") {
                    isSheet = true
                }
                NavigationLink("Push") {
                    RenderView()
                }
            }
            .sheet(isPresented: $isSheet, content: {
                RenderView()
            })
            .fullScreenCover(isPresented: $isFull, content: {
                RenderView()
            })
        }
    }
}

#Preview {
    TransitionView()
}
