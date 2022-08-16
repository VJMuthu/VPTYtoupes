//
//  BottomSheetViewController.swift
//  VPTYtoupe
//
//  Created by iOS on 16/08/22.
//

import Foundation
import UIKit
class BottomSheetViewController:UIViewController{
    @IBOutlet weak var bg_View:UIView!
    override func viewDidLoad() {
       // self.bg_View.backgroundColor = UIColor(white: 0.15, alpha: 1)
        let tap = UITapGestureRecognizer(target: self, action: #selector(TabAction(_:)))
        tap.numberOfTapsRequired = 1
        bg_View.addGestureRecognizer(tap)
        
    }
    @objc func TabAction(_ gesture:UITapGestureRecognizer){
        self.dismiss(animated: false, completion: nil)
    }
}
