//
//  ViewController.swift
//  ReusableViews
//
//  Created by Aram Arakelyan on 16.04.22.
//

import UIKit


class ViewController: UIViewController {
    var textView: TextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView = TextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        initConstraints()
    }

}

extension ViewController {
    func initConstraints() {
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            textView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

