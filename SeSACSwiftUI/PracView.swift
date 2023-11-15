//
//  PracView.swift
//  SeSACSwiftUI
//
//  Created by 홍수만 on 2023/11/14.
//

import SwiftUI

struct PracView: View {
    @State private var isDestinationPresented = false
  
  
  var body: some View {
      Text("hi").onTapGesture {
          self.isDestinationPresented.toggle()
      }.sheet(isPresented: $isDestinationPresented) {
          DestinationView(isDestinationPresented: self.$isDestinationPresented)
      }
  }
}

 
struct DestinationView: View {
    @Binding var isDestinationPresented: Bool
    var body: some View {
        NavigationView {
            NavigationLink(destination: AnotherDestinationView(isDestinationPresented: $isDestinationPresented)) {
                Text("where to go")
            }
        }
    }
}


struct AnotherDestinationView: View {
    @Binding var isDestinationPresented: Bool
    var body: some View {
        NavigationView {
            Text("dismiss all").onLongPressGesture {
                self.isDestinationPresented = false
            }
        }
    }
}

#Preview {
    PracView()
}
