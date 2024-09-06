//
//  Tabbar_VC.swift
//  MVVM-ProgrammaticUI-Example
//
//  Created by Samet Korkmaz on 5.09.2024.
//

import UIKit

class Tabbar_VC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .green
        
        let tabbarApparance = UITabBarAppearance()
        tabbarApparance.configureWithOpaqueBackground()
        tabbarApparance.backgroundColor = .white
        
        tabbarApparance.stackedLayoutAppearance.normal.iconColor = .black
        tabbarApparance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black] 
        
        tabBar.standardAppearance = tabbarApparance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabbarApparance
        }
        
        // Do any additional setup after loading the view.
        let homeVC = Home_VC()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let profileVC = Profile_VC()
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 0)
        
        self.viewControllers = [homeVC, profileVC]
    }
    


}

#Preview("UIKit"){
    Tabbar_VC()
}
