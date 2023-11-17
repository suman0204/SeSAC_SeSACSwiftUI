//
//  SearchView.swift
//  SeSACSwiftUI
//
//  Created by 홍수만 on 2023/11/16.
//

import SwiftUI

//struct SearchView: View {
//    
//    @State var randomNumber = 0
//    
//    init(randomNumber: Int = 0) {
//        self.randomNumber = randomNumber
//        print("SearchView init")
//    }
//    
//    var body: some View {
//        VStack {
//            HueView()
//            jackView
//            kokoView()
//            Text("Bran \(randomNumber)")
//                .background(Color.random())
//            
//            Button("클릭") {
//                randomNumber = Int.random(in: 1...100)
//            }
//        }
//    }
//    
//    var jackView: some View {
//        Text("Jack")
//            .background(Color.random())
//    }
//    
//    func kokoView() -> some View {
//        Text("Koko")
//            .background(Color.random())
//    }
//}

struct Movie: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let color = Color.random()
}

struct SearchView: View {
    
    @State private var searchQuery = "ㅁ마"
    
    let movie = [
        Movie(name: "어벤져스"),
        Movie(name: "어벤져스2"),
        Movie(name: "액스맨"),
        Movie(name: "어벤져스3"),
        Movie(name: "해리포터2"),
        Movie(name: "해리포터3"),
        Movie(name: "A"),
        Movie(name: "AB")
    ]
    
    var filterMovie: [Movie] {
        return searchQuery.isEmpty ? movie : movie.filter { $0.name.contains(searchQuery) }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filterMovie, id: \.id) { item in
                    //NavigationView에서 사용
//                    NavigationLink {
//                        SearchDetailView(movie: item)
//                    } label: {
//                        HStack {
//                                Circle()
//                                    .foregroundColor(item.color)
//                                Text(item.name)
//                            }
//                        .frame(height: 60)
//                    }
                    
                    NavigationLink(value: item) {
                        HStack {
                            Circle()
                                .foregroundColor(item.color)
                            Text(item.name)
                        }
                        .frame(height: 60)
                    }
                }

            }
            .navigationTitle("검색")
            .navigationDestination(for: Movie.self) { item in
                SearchDetailView(movie: item)
            }
        }
        .searchable(text: $searchQuery, placement: .navigationBarDrawer, prompt: "검색어를 입력")
        .onSubmit(of: .search) {
            print("ffdhdfhd")
            
        }
    }
}

struct SearchDetailView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            Text(movie.name)
            
            Button("기본 버튼") {
                print("기본")
            }
            
            Button(action: {
                print("custom")
            }, label: {
                HStack {
                    Circle().foregroundStyle(Color.red)
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                }
                .frame(width: 100, height: 40)
            })
            
//                .foregroundColor(color)
        }
    }
}

#Preview {
    SearchView()
}

struct HueView: View {
    
    init() {
        print("HueView init")
        //네트워크 통신 구문이 init에 들어간다면? -> 과호출 발생할 수 있다
        //init에는 필요한 최소만 들어가야한다
    }
    
    var body: some View {
        Text("Hue")
            .background(Color.random())
    }
}


extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
