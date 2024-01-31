import SwiftUI

struct PopularView: View {
    @State private var popularMovies: [PopularMovie.Results] = []
    @State private var isFirstLaunch = false

    var body: some View {
        BasicView(movies: $popularMovies)
            .onAppear {
                if !isFirstLaunch {
                    callAPI()
                    isFirstLaunch = true
                }
            }
        //要件:リフレッシュ
            .refreshable {
                callAPI()
            }
    }

    func callAPI() {
        APIClient().call() { result in
            switch result {
            case .success(let data):
                let popular = try! JSONDecoder().decode(PopularMovie.self, from: data)
                popularMovies = popular.results
            case .failure(let error):
                print(error)
            }
        }
    }
}

#Preview {
    PopularView()
}
