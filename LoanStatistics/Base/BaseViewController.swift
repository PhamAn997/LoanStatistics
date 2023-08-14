//
//  BaseViewController.swift
//  LoanStatistics
//
//  Created by TTH on 14/08/2023.
//

import UIKit
import SafariServices

class BaseViewController: UIViewController {
    
    var didSelectImage: ((UIImage) -> Void)?
    
    func tabBarHidden() -> Bool {
        return false
    }
    
    func navBarHidden() -> Bool {
        return true
    }
    
    func configureUI() {}
    func bindViewModel() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = R.color.bG()
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .didUpdateDB, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = tabBarHidden()
        navigationController?.navigationBar.isHidden = navBarHidden()
    }
    
    @objc func handleNotification(_ notification: Notification) {}
    
    func addChildVC(_ vc: UIViewController, to viewDes: UIView) {
        addChild(vc)
        viewDes.addSubview(vc.view)
        vc.view.frame = viewDes.bounds
        vc.didMove(toParent: self)
    }
    
    func removeChildVC(_ vc: UIViewController) {
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
    }
    
    func openWeb(urlString: String) {
        guard let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: urlString) else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    func openLibrary() {
//        imagePickerVC.delegate = self
//        present(imagePickerVC, animated: true)
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.dismiss(animated: true)
//
//        if let image = info[.originalImage] as? UIImage {
//            didSelectImage?(image)
//        }
//    }
    
    func shareApp(with id: String) {
       let items:[Any] = [URL(string: "https://apps.apple.com/app/id\(id)")!]
       let activityViewController = UIActivityViewController(activityItems:items, applicationActivities: nil)
       activityViewController.excludedActivityTypes = [
           UIActivity.ActivityType.postToWeibo,
           UIActivity.ActivityType.print,
           UIActivity.ActivityType.assignToContact,
           UIActivity.ActivityType.addToReadingList,
           UIActivity.ActivityType.postToFlickr,
           UIActivity.ActivityType.postToVimeo,
           UIActivity.ActivityType.postToTencentWeibo,
           UIActivity.ActivityType.postToFacebook,
           UIActivity.ActivityType.airDrop,
           UIActivity.ActivityType.mail,
           UIActivity.ActivityType.message
       ]
       
       if let popoverController = activityViewController.popoverPresentationController {
           popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY,width: 0,height: 0)
           popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
       }
       
       if UIDevice.current.userInterfaceIdiom == .pad {
           activityViewController.popoverPresentationController?.sourceView = self.view
           activityViewController.popoverPresentationController?.sourceRect = self.view.bounds
       }
      
       self.present(activityViewController, animated: true, completion: nil)
   }
}

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}
