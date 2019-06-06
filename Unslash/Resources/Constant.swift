//
//  Constant.swift
//  Unslash
//
//  Created by Zahar on 06/06/2019.
//

import UIKit


enum Storyboard: String {
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}

enum ViewControllers: String {
    case searchViewController = "SearchViewController"
    case resultViewController = "ResultViewController"
    case detailViewController = "DetailViewController"
    
    func instance(fromStoryboard storyBoard: UIStoryboard) -> UIViewController {
        return storyBoard.instantiateViewController(withIdentifier: self.rawValue)
        
    }
}

//enum SegueIdentifier: String {
//    //    case goToResult = "goToResult"
//}

