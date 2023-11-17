//
//  TransitionView.swift
//  SeSACSwiftUI
//
//  Created by 홍수만 on 2023/11/15.
//

import SwiftUI
/*
 버튼을 클릭해서 화면 Dismiss/Pop
 화면 전환 시 
*/
struct TransitionView: View {
    
    @State private var isFull = false
    @State private var isSheet = false
    
    init(isFull: Bool = false, isSheet: Bool = false) {
        self.isFull = isFull
        self.isSheet = isSheet
        print("TransitionView Init")
    }
    
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
//                    RenderView()
                    NavigationLazyView(RenderView())
                }
                NavigationLink("Push") {
                    NavigationLazyView(PosterView())
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
