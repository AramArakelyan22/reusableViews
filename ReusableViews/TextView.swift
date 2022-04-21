//
//  TextView.swift
//  ReusableViews
//
//  Created by Aram Arakelyan on 16.04.22.
//

import Foundation
import UIKit

struct TextFieldViewData {
    enum KeyboardType {
        case emailPad
        case numberPad
        case namePhonepad
    }
}

class TextView: UIView {
    var titleLable: UILabel!
    var textField: UITextField!
    var wrapperView: UIView!
    var eyeButton: UIButton!
    var isTextSecure: Bool = true
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}

// MARK: - Layout
extension TextView {
    func initTitleLable() {
        titleLable = UILabel()
        titleLable.text = "Name"
        titleLable.textAlignment = .left
        titleLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initTextField() {
        textField = UITextField()
        textField.placeholder = "Placeholder Text"
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initWrapperView() {
        wrapperView = UIView()
        wrapperView.layer.borderWidth = 1
        wrapperView.layer.borderColor = UIColor.black.cgColor
        wrapperView.layer.cornerRadius = 6
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initEyeButton() {
        eyeButton = UIButton()
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func commonInit() {
        initTitleLable()
        initTextField()
        initWrapperView()
        initEyeButton()
        constructHierarchy()
        initConstraints()
        setupTextFieldActions()
        eyeButton.addTarget(self, action: #selector(eyeButtonTaped), for: .touchUpInside)
    }
    
    private func constructHierarchy() {
        addSubview(titleLable)
        addSubview(wrapperView)
        wrapperView.addSubview(textField)
        wrapperView.addSubview(eyeButton)
    }
    
    private func setupTextFieldActions() {
        textField.addTarget(self, action: #selector(editing), for: .editingChanged)
    }
    
    @objc func editing() {
        wrapperView.layer.borderColor = UIColor.blue.cgColor
    }
    
    @objc func eyeButtonTaped() {
    
        isTextSecure ? eyeButton.setImage(UIImage(systemName: "eye"), for: .normal) : eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        textField.isSecureTextEntry = !isTextSecure
        isTextSecure.toggle()
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLable.bottomAnchor.constraint(equalTo: wrapperView.topAnchor),
            
            wrapperView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 5),
            wrapperView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            wrapperView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            wrapperView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            textField.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -8),
            textField.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor),
            
            eyeButton.widthAnchor.constraint(equalToConstant: 30),
            eyeButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -16),
            eyeButton.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            eyeButton.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor),
        ])
    }
}
