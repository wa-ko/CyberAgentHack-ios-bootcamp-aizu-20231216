//
//  BasicView.swift
//  Day3Homework
//
//  Created by 若生優希 on 2024/01/15.
//

import SwiftUI
import Kingfisher
import Lottie

//MARK: PopularViewとFavoriteViewの共通部分
struct BasicView: View {
    @Binding var movies: [PopularMovie.Results]
    // 状態変数を保持するインスタンス
    @ObservedObject var favoritesManager = FavoritesManager.shared
    @State var showingSheet = false



    let baseURL = "https://image.tmdb.org/t/p/"
    let fileSize = "w500/"

    var body: some View {
        //要件:一覧表示
        ScrollViewReader{ proxy in
            ScrollView {
                ForEach(movies, id: \.id) { popular in
                    LazyVStack(alignment: .leading, spacing: 8) {
                        //要件:サムネイルの画像表示
                        Text(popular.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        HStack{
                            Text(popular.releaseDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Text(popular.originalLanguage)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(6)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                        }
                        //要件:外部パッケージ(Kingfisher)を使って画像を表示
                        ZStack{
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))

                            Button(action: {
                                showingSheet.toggle()
                            }) {
                                KFImage(URL(string: baseURL + fileSize + popular.backdropPath)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        .aspectRatio(16/9, contentMode: .fit)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)

                            Text(String(round(popular.voteAverage * 10) / 10))
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Button(action: {
                                favoritesManager.toggleFavorite(movieResult: popular)
                                print("Button pushed")
                            }) {
                                if favoritesManager.isFavorite(popular: popular) {
                                    LottieView(animation: .named("HeartAnimation"))
                                        .playing()
                                        .frame(width: 60, height: 60)
                                } else {
                                    LottieView(animation: .named("HeartAnimation"))
                                        .frame(width: 60, height: 60)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding()

                        Text(popular.overview)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.top, 8)

                        Divider()
                    }
                    .padding(.horizontal, 16)
                    .sheet(isPresented: $showingSheet) {
                        KFImage(URL(string: baseURL + fileSize + popular.posterPath)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
        }
    }
}

class FavoritesManager: ObservableObject {
    //シングルトン→インスタンスを一つしかつくれないことを保証
    static var shared = FavoritesManager()

    @Published var favoriteMovies: [PopularMovie.Results] = []

    init() {
        // 保存されたお気に入りでfavoriteMovies配列を初期化
        favoriteMovies = callFavoriteStates()
    }

    private let favoritesKey = "Favorites"

    func callFavoriteStates() -> [PopularMovie.Results] {
        if let savedFavorites = UserDefaults.standard.object(forKey: favoritesKey) as? Data,
           let loadedFavorites = try? JSONDecoder().decode([PopularMovie.Results].self, from: savedFavorites) {
            return loadedFavorites
        }
        return []
    }

    func toggleFavorite(movieResult: PopularMovie.Results) {
        var favoriteMovies = callFavoriteStates()

        if let index = favoriteMovies.firstIndex(where: { $0.id == movieResult.id }) {
            favoriteMovies.remove(at: index)
        } else {
            favoriteMovies.append(movieResult)
        }
        saveFavoriteStates(favoriteMovies)
    }

    func isFavorite(popular: PopularMovie.Results) -> Bool {
        let isFavorite = callFavoriteStates().contains(where: { $0.id == popular.id })
        return isFavorite
    }

    private func saveFavoriteStates(_ favorites: [PopularMovie.Results]) {
        if let favoritesData = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(favoritesData, forKey: favoritesKey)
        }
        objectWillChange.send() // ビューを更新するために変更を通知
    }
}

