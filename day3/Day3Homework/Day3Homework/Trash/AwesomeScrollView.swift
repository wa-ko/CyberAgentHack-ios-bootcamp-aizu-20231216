////
////  AwesomeScrollView.swift
////  Day3Homework
////
////  Created by 若生優希 on 2024/01/19.
////
//
//import SwiftUI
//
//struct AwesomeScrollView: View {
//    // ・・・ Sectionのデータ情報など
//
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 20) {
//                ForEach(sections) { section in
//                    // GeometryReaderを使ってセクションを配置
//                    GeometryReader { geometry in
//                        makeSection(section: section)
//                            .rotation3DEffect(
//                                Angle(
//                                    degrees: Double(geometry.frame(in: .global).minX - 30) / -20),
//                                    axis: (x: 0, y: 1, z: 0))
//                    }
//                    .frame(width: 275, height: 275)
//                }
//            }
//            .padding(30)
//            .padding(.bottom, 30)
//        }
//    }
//
//    // セクションのビューを作成する関数
//    @ViewBuilder
//    func makeSection(section: Section) -> some View {
//        VStack {
//            HStack(alignment: .top) {
//                Text(section.title)
//                    .font(.system(size: 24, weight: .bold))
//                    .frame(width: 160, alignment: .leading)
//                    .foregroundColor(.white)
//                Spacer()
//                section.logo
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 50, height: 50)
//            }
//
//            Text(section.text)
//                .font(.system(size: 15, weight: .bold))
//                .frame(maxWidth: .infinity, alignment: .leading)
//
//            section.image
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 210)
//        }
//        .padding(.top, 20)
//        .padding(.horizontal, 20)
//        .frame(width: 275, height: 275)
//        .background(section.color)
//        .cornerRadius(30)
//        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
//    }
//}
//
//#Preview {
//    static var previews: some View {
//        AwesomeScrollView()
//    }
//}
