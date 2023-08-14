//
//  SettingViewController.swift
//  LoanStatistics
//
//  Created by TTH on 14/08/2023.
//

import UIKit
import StoreKit

class SettingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }

    @IBAction func websiteApp(_ sender: Any) {
        openWeb(urlString: "http://datanomic.online/")
    }
    
    @IBAction func rateApp(_ sender: Any) {
        SKStoreReviewController.requestReview()
    }
    
 
    @IBAction func shareApp(_ sender: Any) {
        shareApp(with: "123445")
    }
    
}
