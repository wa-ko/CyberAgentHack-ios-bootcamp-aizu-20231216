//
//  LongTap.swift
//  Day3Homework
//
//  Created by 若生優希 on 2024/01/26.
//

import SwiftUI

import SwiftUI

struct LongTapView: View {
    var body: some View {
        List(weathers) { weather in
            Label {
                Text(weather.title)
            } icon: {
                Image(systemName: weather.iconName)
                    .foregroundColor(weather.iconColor)
            }

            .contextMenu {
                Text("falskjdf;lkajsd")
            }
        }
        .listStyle(.grouped)
    }
}

struct Weather: Identifiable {
    let id = UUID()
    let iconName: String
    let iconColor: Color
    let title: String
}

let weathers: [Weather] = [
    .init(iconName: "sun.max.fill", iconColor: .orange, title: "晴れ"),
    .init(iconName: "cloud.fill", iconColor: .gray, title: "曇り"),
    .init(iconName: "cloud.rain.fill", iconColor: .blue, title: "雨")
]

#Preview {
    LongTapView()
}
