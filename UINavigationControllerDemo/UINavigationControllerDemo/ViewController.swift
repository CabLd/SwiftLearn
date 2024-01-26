//
//  ViewController.swift
//  UINavigationControllerDemo
//
//  Created by yangtz on 2024/1/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPurple

        self.navigationItem.title = "Home"
//        self.title = "Home"
//        self.navigationController?.title = ""
//        self.navigationController?.navigationItem.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "LButton", style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(didTapButton))

//        self.navigationItem.largeTitleDisplayMode = .never

    }
    @objc private func didTapButton() {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true	)
    }

}

