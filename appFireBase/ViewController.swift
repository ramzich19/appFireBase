//
//  ViewController.swift
//  appFireBase
//
//  Created by Рамазан Нуриев on 11.11.2021.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func shareAction(_ sender: Any) {
        let items:[Any] = [URL(string: "https://apple.com")!,UIImage(named: "pngegg")!]
        
        let myActivity = MyActivity(title: "My button", image: UIImage(named: "bg")) { (items) in
            print(items)
        }
  
        let avc = UIActivityViewController(activityItems: items, applicationActivities: [myActivity])
//        avc.excludedActivityTypes = [.airDrop,.saveToCameraRoll]
        self.present(avc, animated: true, completion: nil)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
        
    }
    
}

