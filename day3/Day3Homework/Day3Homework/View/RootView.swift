//参考:https://makitsystem.xyz/blog/2020-11-27-swiftui-tabview/
import SwiftUI

enum Tab {
    case popular
    case favorite
}

struct RootView: View {

    init() {
        // 非選択時の画像、テキスト色
        UITabBar.appearance().unselectedItemTintColor = .gray
        // タブ背景色
        UITabBar.appearance().backgroundImage = UIImage.imageWithColor(.white, size: CGSize(width: 1.0, height: 1.0))
        // タブボーダー色
        UITabBar.appearance().shadowImage = UIImage.imageWithColor(.brown, size: CGSize(width: 1.0, height: 1.0))
    }

    var body: some View {
        TabView {
            PopularView()
                .tag(Tab.popular)
                .tabItem {
                    Label(
                        title: { Text("人気") },
                        icon: { Image(systemName: "crown.fill") }
                    )
                }
            FavoriteView()
                .tag(Tab.favorite)
                .tabItem {
                    Label(
                        title: { Text("お気に入り") },
                        icon: { Image(systemName: "list.star") }
                    )
                }
        }
        .accentColor(.red)
    }
}

extension UIImage {
    class func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: size.width, height: size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}


#Preview {
    RootView()
}

