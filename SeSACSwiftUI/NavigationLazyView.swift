//
//  NavigationLazyView.swift
//  SeSACSwiftUI
//
//  Created by 홍수만 on 2023/11/17.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {
    let build: () -> T
    
    init(_ build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    
    var body: some View {
        build()
    }
}

//struct NavigationLazyView2: View {
//    var body: some View {
//        PosterView()
//    }
//}

//#Preview {
//    NavigationLazyView()
//}
