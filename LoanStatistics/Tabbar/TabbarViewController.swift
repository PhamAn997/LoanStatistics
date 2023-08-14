//
//  TabbarViewController.swift
//  LoanStatistics
//
//  Created by TTH on 14/08/2023.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabs()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let tabBarHeight = CGFloat(50) + view.safeAreaInsets.bottom
        var newFrame = tabBar.frame
        newFrame.size.height = tabBarHeight
        newFrame.origin.y = view.frame.size.height - tabBarHeight
        tabBar.frame = newFrame
    }
    
    private func createTabs() {
        tabBar.backgroundColor = .white
        
        let homeVC = DebtViewController(nibName: "DebtViewController", bundle: nil)
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(title: "",
                                          image: R.image.ic_tab_home()?.withRenderingMode(.alwaysOriginal),
                                          selectedImage: R.image.ic_tab_home_selected()?.withRenderingMode(.alwaysOriginal))
        
        let peopleVC = PeppleViewController(nibName: "PeppleViewController", bundle: nil)
        let peopleNav = UINavigationController(rootViewController: peopleVC)
        peopleNav.tabBarItem = UITabBarItem(title: "",
                                            image: R.image.ic_tab_people()?.withRenderingMode(.alwaysOriginal),
                                            selectedImage: R.image.ic_tab_people_selected()?.withRenderingMode(.alwaysOriginal))
            
        let reportVC = ReportViewController(nibName: "ReportViewController", bundle: nil)
        let reportNav = UINavigationController(rootViewController: reportVC)
        reportNav.tabBarItem = UITabBarItem(title: "",
                                            image: R.image.ic_tab_report()?.withRenderingMode(.alwaysOriginal),
                                            selectedImage: R.image.ic_tab_report_selected()?.withRenderingMode(.alwaysOriginal))
        
        let settingsVC = SettingViewController(nibName: "SettingViewController", bundle: nil)
        let settingsNav = UINavigationController(rootViewController: settingsVC)
        settingsNav.tabBarItem = UITabBarItem(title: "",
                                              image: R.image.ic_tab_settings()?.withRenderingMode(.alwaysOriginal),
                                              selectedImage: R.image.ic_tab_settings_selected()?.withRenderingMode(.alwaysOriginal))
        
        viewControllers = [homeNav, peopleNav, reportNav, settingsNav]
    }

    

}
