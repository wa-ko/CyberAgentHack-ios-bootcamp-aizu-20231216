//
//  Heart.swift
//  Day3Homework
//
//  Created by 若生優希 on 2024/01/16.
//

import SwiftUI
import Foundation

struct HeartButton: View {

    @Binding var isLiked : Bool

    private let animationDuration : Double = 0.1
    private var animationScale : CGFloat {
        isLiked ? 0.7 : 1.3
    }

    @State private var animate = false

    var body: some View {

        Button(action: {
            self.animate = true

            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDuration, execute: {
                self.animate = false
                self.isLiked.toggle()
            })


            if isLiked == true {
                // push button
                print("true")
            } else {
                // And push Button
                print("false")
            }
        }, label: {
            Image(systemName: isLiked ? "heart.fill": "heart")
                .font(.largeTitle)
                .foregroundColor(Color.red)
                .frame(width: 100, height: 100)
        })
        .scaleEffect(animate ? animationScale : 1)
        .animation(.easeIn(duration: animationDuration))
    }
}
