//
//  TabViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 08.12.23.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
        // Do any additional setup after loading the view.
    }
    func setUpTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "film")!, and: HomePageViewController())
        let people = self.createNav(with: "People", and: UIImage(systemName: "person.fill")!, and: PeoplePageViewController())
        let login = self.createNav(with: "Login", and: UIImage(systemName: "person.crop.circle")!, and: LoginPageViewController())
        viewControllers = [home, people, login]
    }

    func createNav(with name: String, and image: UIImage, and vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = name
        nav.tabBarItem.image = image
        return nav
    }
}
