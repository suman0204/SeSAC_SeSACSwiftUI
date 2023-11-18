//
//  ChartView.swift
//  SeSACSwiftUI
//
//  Created by 홍수만 on 2023/11/17.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    let movie: [Movie]
    
    @Environment(\.colorScheme) var colorScheme
    
    @ViewBuilder
    var chartTitle: some View {
//        Text(colorScheme == .dark ? "다크차트" : "라이트 차트")
        if colorScheme == .dark {
            Text("다크 차트")
        } else {
            Text("라이트 차트")
        }
    }
    
    var body: some View {
        VStack {
            chartTitle
            Chart(movie, id: \.self) { item in
//                BarMark(
//                RectangleMark(
//                LineMark(
                AreaMark(
                    x: .value("장르", item.name),
                    y: .value("관람횟수", item.count)
                )
                .foregroundStyle(Color.random())
            }
            .frame(height: 200)
        }
    }
}

#Preview {
    ChartView(movie: [
        Movie(name: "SF"),
        Movie(name: "액션"),
        Movie(name: "스릴러"),
        Movie(name: "로맨스"),
        Movie(name: "가족"),
        Movie(name: "애니메이션")
    ])
}
