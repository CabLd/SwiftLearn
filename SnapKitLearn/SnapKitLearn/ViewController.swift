//
//  ViewController.swift
//  SnapKitLearn
//
//  Created by yangtz on 2024/1/16.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.blue

        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
        
        
    }

}

