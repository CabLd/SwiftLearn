//
//  TabController.swift
//  TabBarDemo
//
//  Created by yangtz on 2024/1/26.
//

import UIKit

class TabController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen
        self.setupTabs()
        
//        self.selectedIndex = 3 
//        self.tabBar.barTintColor = .red
        self.tabBar.tintColor = .green
//        self.tabBar.barTintColor = .white
        self.tabBar.unselectedItemTintColor = .purple

        self.delegate = self
    }

    // MARK: - Tab Setup
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeController())
        let history = self.createNav(with: "History", and: UIImage(systemName: "clock"), vc: HistoryController())
        let workout = self.createNav(with: "Exercise", and: UIImage(systemName: "person"), vc: WorkoutController())
        let exercise = self.createNav(with: "Exercise", and: UIImage(systemName: "cloud.snow"), vc: ExerciseController())
        self.setViewControllers([home, history, workout, exercise], animated: true)
    }

    private func createNav(with title: String, and image: UIImage?,
                           vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        nav.viewControllers.first?.navigationItem.rightBarButtonItem =
        UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        return nav
    }

//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        return false
//    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let alert = UIAlertController(title: "Hello", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
