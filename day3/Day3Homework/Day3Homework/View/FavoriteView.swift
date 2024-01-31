import SwiftUI

struct FavoriteView: View {
    @State private var favoriteMovies: [PopularMovie.Results] = []

    var body: some View {
        BasicView(movies: $favoriteMovies)
        .onAppear {
            favoriteMovies = FavoritesManager.shared.callFavoriteStates()
        }
        //要件:リフレッシュ
        .refreshable {
            favoriteMovies = FavoritesManager.shared.callFavoriteStates()
        }
    }
}

#Preview {
    FavoriteView()
}
