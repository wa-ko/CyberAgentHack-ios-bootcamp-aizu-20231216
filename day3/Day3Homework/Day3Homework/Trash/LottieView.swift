////
////  LottieView.swift
////  Day3Homework
////
////  Created by 若生優希 on 2024/01/18.
////
//
//import SwiftUI
//import Lottie
//
////struct LottieView: UIViewRepresentable {
////    var name: String
////    var animationView = LottieAnimationView()
////    
////    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
////        let view = UIView(frame: .zero)
////        // 表示したいアニメーションのファイル名
////        animationView.animation = LottieAnimation.named(name)
////        // 比率
////        animationView.contentMode = .scaleAspectFit
////        animationView.loopMode = .loop
////        animationView.play()
////        animationView.translatesAutoresizingMaskIntoConstraints = false
////        view.addSubview(animationView)
////        NSLayoutConstraint.activate([
////            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
////            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
////        ])
////        return view
////    }
////    
////    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
////    }
////}
//
//struct LottieButton: UIViewRepresentable {
//
//    let animationView = AnimatedButton()
//    let filename: String
//    let action: () -> Void
//
//    func makeUIView(context: UIViewRepresentableContext<LottieButton>) -> UIView {
//        let view = UIView()
//
//        let animation = LottieAnimation.named(filename)
//        animationView.animation = animation
//        animationView.contentMode = .scaleAspectFit
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(animationView)
//
//        NSLayoutConstraint.activate([
//            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
//        ])
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieButton>) {
//
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//
//    class Coordinator: NSObject {
//        let parent: LottieButton
//
//        init(_ parent: LottieButton) {
//            self.parent = parent
//            super.init()
//            parent.animationView.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
//        }
//
//        // this function can be called anything, but it is best to make the names clear
//        @objc func touchUpInside() {
//            parent.action()
//        }
//    }
//}
//
//struct LottieSwitch: UIViewRepresentable {
//    let animationView = AnimatedButton()
//    let filename: String
//    
//    func updateUIView(_ uiView: UIView, context: Context) {
//    }
//
//
//    func makeUIView(context: UIViewRepresentableContext<LottieButton>) -> UIView {
//        let view = UIView()
//
//        let animation = LottieAnimation.named(filename)
//        animationView.animation = animation
//        animationView.contentMode = .scaleAspectFit
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(animationView)
//
//        NSLayoutConstraint.activate([
//            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
//        ])
//
//        return view
//    }
//
//}
//
//struct TestView: View {
//
//    @State private var tapped: Int = 0
//
//    var body: some View {
//        VStack {
//            LottieButton(filename: "HeartAnimation", action: {
//
//            })
//            .frame(width: 200, height: 200)
//
//            Text("tapped count \(tapped)")
//        }
//    }
//}
//
//#Preview {
//    TestView()
//}
