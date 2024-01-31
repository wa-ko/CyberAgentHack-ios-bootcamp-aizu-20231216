//
//  ContentView.swift
//  CardApp
//
//  Created by Yaguchi Sato on 2021/12/07.
//

import SwiftUI

struct ContentView: View {
    @State private var popularMovies: [PopularMovie.Results] = []
    @State private var favoriteMovies: [PopularMovie.Results] = []

  var body: some View {

        TabView{
//TabViewのページ要素がForEachで作るトランプ画像
            ForEach(1...10,id: \.self){num in
                    BasicView(
                        movies: $popularMovies
                    )
                        .onAppear {
                            callAPI()

                        }
                        //要件:リフレッシュ
                        .refreshable {
                            callAPI()
                        }
                //トランプの形
                    .frame(
                        width:UIScreen.main.bounds.size.width * 0.8,
                        height:UIScreen.main.bounds.size.height * 0.75
                    )
                    .background(RoundedRectangle(cornerRadius: 15)
                                .fill(Color(.white))
                                //影をつける
                                .shadow(radius: 10))

                .padding(.horizontal,(UIScreen.main.bounds.size.width * 0.1))


            }
        }
//ページングできるTabViewのスタイルを指定
        .tabViewStyle(PageTabViewStyle())
//PageControl(ページ送りの丸ぽち)のスタイル指定
//.alwaysを.neverにするとPageControlは非表示になる
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

  }
    func callAPI() {
        APIClient().call() { result in
            switch result {
            case .success(let data):
                let popular = try! JSONDecoder().decode(PopularMovie.self, from: data)
                self.popularMovies = popular.results
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
