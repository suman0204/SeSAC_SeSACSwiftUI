//
//  PosterView.swift
//  SeSACSwiftUI
//
//  Created by 홍수만 on 2023/11/15.
//

import SwiftUI

struct PosterView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        ScrollView(showsIndicators: true) {
            LazyVStack {
//                print("")
                ForEach(0..<50) { item in
                    AsyncImageView()
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            print("Tap")
                            isPresented.toggle()
                        }
                }
            }
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
        .background(.gray)
        .sheet(isPresented: $isPresented, content: {
            CategoryView()
        })
//        .contentMargins(50, for: .scrollContent)
    }
}

struct AsyncImageView: View {
    
    let url = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            case .failure(_):
                Image(systemName: "star")
            @unknown default:
                Image(systemName: "star")
            }
        }
        
//        AsyncImage(url: url) { image in
//            image
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
////                .cornerRadius(10)
//        } placeholder: {
////            Image(systemName: "star")
//            ProgressView()
//        }

//        AsyncImage(url: url)
    }
}

#Preview {
    PosterView()
}
