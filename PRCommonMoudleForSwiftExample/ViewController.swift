//
//  ViewController.swift
//  PRCommonMoudleForSwift
//
//  Created by 彭睿 on 2019/5/22.
//  Copyright © 2019 彭睿. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavItem(title: "点击", attributes: Dictionary(), theLeft: false, image: nil, handle: {
            print("0000000")
        })
    }
}


