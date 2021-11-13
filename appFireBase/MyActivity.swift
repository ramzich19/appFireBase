//
//  MyActivity.swift
//  appFireBase
//
//  Created by Рамазан Нуриев on 13.11.2021.
//

import Foundation
import UIKit


class MyActivity: UIActivity {
    var title:String
    var image:UIImage?
    var items:[Any] = [Any]()
    var action:([Any])->Void
    
    
    init(title:String,image:UIImage?,action:@escaping ([Any])->Void){
        self.title = title
        self.image = image
        self.action = action
        super.init()
    }
    
    override var activityTitle: String?{
        return self.title
    }
    
    override var activityImage: UIImage?{
        return self.image
    }
    
    
    override var activityType: UIActivity.ActivityType?{
        return UIActivity.ActivityType("myactivity.activity")
    }
    
    override class var activityCategory: UIActivity.Category{
        return .action
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
//        for item in activityItems{
//            if item is UIImage{
//                return false
//            }
//        }
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        self.items = activityItems
    }
    
    override func perform() {
        action(self.items)
        activityDidFinish(true)
    }
}
