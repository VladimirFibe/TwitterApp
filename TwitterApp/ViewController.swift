import UIKit

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let home = UINavigationController(rootViewController: HomeViewController())
        let search = UINavigationController(rootViewController: UIViewController())
        let notifications = UINavigationController(rootViewController: UIViewController())
        let messages = UINavigationController(rootViewController: UIViewController())
        home.tabBarItem = UITabBarItem(title: nil, image: .home, selectedImage: .homeFill)
        search.tabBarItem = UITabBarItem(title: nil, image: .search, selectedImage: .search)
        notifications.tabBarItem = UITabBarItem(title: nil, image: .notifications, selectedImage: .notificationsFill)
        messages.tabBarItem = UITabBarItem(title: nil, image: .messages, selectedImage: .messagesFill)
        view.backgroundColor = .systemBackground
        setViewControllers([home, search, notifications, messages], animated: true)
    }
}

