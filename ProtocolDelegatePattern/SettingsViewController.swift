//
//  SettingsViewController.swift
//  ProtocolDemo
//
//  Created by Alex Nagy on 07/12/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import UIKit
protocol  SettingsViewControllerDelegate{
    func didChange(_ profile:Profile)
}
class SettingsViewController: UIViewController {
    var settingsViewControllerDelegate:SettingsViewControllerDelegate?
    lazy var saveBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "checkmark"), style: .done, target: self, action: #selector(saveBarButtonItemTapped))
    
    @objc fileprivate func saveBarButtonItemTapped() {
        let profile = Profile(icon: "icon\(UserDefaults.standard.integer(forKey: kIconButton))", accentColor: colors[UserDefaults.standard.integer(forKey: kColorButton)], name: nameTextField.text ?? "", info: infoTextField.text ?? "")
        print(profile)
        settingsViewControllerDelegate?.didChange(profile)
        navigationController?.popViewController(animated: true)
    }
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter Name"
        return tf
    }()
    
    lazy var infoTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter Info"
        return tf
    }()
    
    let icon0Button = UIButton()
    let icon1Button = UIButton()
    let icon2Button = UIButton()
    
    lazy var iconsStackView: UIStackView = {
        icon0Button.addTarget(self, action: #selector(icon0ButtonTapped), for: .touchUpInside)
        icon1Button.addTarget(self, action: #selector(icon1ButtonTapped), for: .touchUpInside)
        icon2Button.addTarget(self, action: #selector(icon2ButtonTapped), for: .touchUpInside)
        icon0Button.setImage(UIImage(named: "icon0")?.withRenderingMode(.alwaysTemplate), for: .normal)
        icon1Button.setImage(UIImage(named: "icon1")?.withRenderingMode(.alwaysTemplate), for: .normal)
        icon2Button.setImage(UIImage(named: "icon2")?.withRenderingMode(.alwaysTemplate), for: .normal)
        icon0Button.imageView?.contentMode = .scaleAspectFit
        icon1Button.imageView?.contentMode = .scaleAspectFit
        icon2Button.imageView?.contentMode = .scaleAspectFit
        icon0Button.layer.cornerRadius = 10
        icon1Button.layer.cornerRadius = 10
        icon2Button.layer.cornerRadius = 10
        icon0Button.layer.borderWidth = 3
        icon1Button.layer.borderWidth = 3
        icon2Button.layer.borderWidth = 3
        icon0Button.imageView?.tintColor = UIColor.systemBlue
        icon1Button.imageView?.tintColor = UIColor.systemBlue
        icon2Button.imageView?.tintColor = UIColor.systemBlue
        let stackView = UIStackView(arrangedSubviews: [icon0Button, icon1Button, icon2Button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 15
        return stackView
    }()
    
    func updateIconsButtons() {
        icon0Button.layer.borderColor = UserDefaults.standard.integer(forKey: kIconButton) == 0 ? UIColor.systemBlue.cgColor : UIColor.clear.cgColor
        icon1Button.layer.borderColor = UserDefaults.standard.integer(forKey: kIconButton) == 1 ? UIColor.systemBlue.cgColor : UIColor.clear.cgColor
        icon2Button.layer.borderColor = UserDefaults.standard.integer(forKey: kIconButton) == 2 ? UIColor.systemBlue.cgColor : UIColor.clear.cgColor
    }
    
    let colors = [UIColor.systemRed, UIColor.systemGray, UIColor.systemGreen, UIColor.systemPurple, UIColor.systemOrange]
    
    let color0Button = UIButton()
    let color1Button = UIButton()
    let color2Button = UIButton()
    let color3Button = UIButton()
    let color4Button = UIButton()
    
    lazy var accentColorsStackView: UIStackView = {
        color0Button.addTarget(self, action: #selector(color0ButtonTapped), for: .touchUpInside)
        color1Button.addTarget(self, action: #selector(color1ButtonTapped), for: .touchUpInside)
        color2Button.addTarget(self, action: #selector(color2ButtonTapped), for: .touchUpInside)
        color3Button.addTarget(self, action: #selector(color3ButtonTapped), for: .touchUpInside)
        color4Button.addTarget(self, action: #selector(color4ButtonTapped), for: .touchUpInside)
        color0Button.backgroundColor = colors[0]
        color1Button.backgroundColor = colors[1]
        color2Button.backgroundColor = colors[2]
        color3Button.backgroundColor = colors[3]
        color4Button.backgroundColor = colors[4]
        color0Button.layer.cornerRadius = 10
        color1Button.layer.cornerRadius = 10
        color2Button.layer.cornerRadius = 10
        color3Button.layer.cornerRadius = 10
        color4Button.layer.cornerRadius = 10
        color0Button.layer.borderWidth = 3
        color1Button.layer.borderWidth = 3
        color2Button.layer.borderWidth = 3
        color3Button.layer.borderWidth = 3
        color4Button.layer.borderWidth = 3
        color0Button.layer.masksToBounds = true
        color1Button.layer.masksToBounds = true
        color2Button.layer.masksToBounds = true
        color3Button.layer.masksToBounds = true
        color4Button.layer.masksToBounds = true
        let stackView = UIStackView(arrangedSubviews: [color0Button, color1Button, color2Button, color3Button, color4Button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()
    
    func updateColorsButtons() {
        color0Button.layer.borderColor = UserDefaults.standard.integer(forKey: kColorButton) == 0 ? UIColor.systemBlue.cgColor : UIColor.clear.cgColor
        color1Button.layer.borderColor = UserDefaults.standard.integer(forKey: kColorButton) == 1 ? UIColor.systemBlue.cgColor : UIColor.clear.cgColor
        color2Button.layer.borderColor = UserDefaults.standard.integer(forKey: kColorButton) == 2 ? UIColor.systemBlue.cgColor : UIColor.clear.cgColor
        color3Button.layer.borderColor = UserDefaults.standard.integer(forKey: kColorButton) == 3 ? UIColor.systemBlue.cgColor : UIColor.clear.cgColor
        color4Button.layer.borderColor = UserDefaults.standard.integer(forKey: kColorButton) == 4 ? UIColor.systemBlue.cgColor : UIColor.clear.cgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigation()
        setupView()
        updateIconsButtons()
        updateColorsButtons()
    }

    fileprivate func setupNavigation() {
        title = "Settings"
        navigationItem.setRightBarButton(saveBarButtonItem, animated: false)
    }
    
    fileprivate func setupView() {
        guard let view = view else { return }
        
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(nameTextField)
        view.addSubview(infoTextField)
        view.addSubview(iconsStackView)
        view.addSubview(accentColorsStackView)
        
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        infoTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 32).isActive = true
        infoTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        infoTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        iconsStackView.topAnchor.constraint(equalTo: infoTextField.bottomAnchor, constant: 32).isActive = true
        iconsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        iconsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        iconsStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        accentColorsStackView.topAnchor.constraint(equalTo: iconsStackView.bottomAnchor, constant: 32).isActive = true
        accentColorsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        accentColorsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc fileprivate func icon0ButtonTapped() {
        UserDefaults.standard.set(0, forKey: kIconButton)
        updateIconsButtons()
    }
    
    @objc fileprivate func icon1ButtonTapped() {
        UserDefaults.standard.set(1, forKey: kIconButton)
        updateIconsButtons()
    }
    
    @objc fileprivate func icon2ButtonTapped() {
        UserDefaults.standard.set(2, forKey: kIconButton)
        updateIconsButtons()
    }
    
    @objc fileprivate func color0ButtonTapped() {
        UserDefaults.standard.set(0, forKey: kColorButton)
        updateColorsButtons()
    }
    
    @objc fileprivate func color1ButtonTapped() {
        UserDefaults.standard.set(1, forKey: kColorButton)
        updateColorsButtons()
    }

    @objc fileprivate func color2ButtonTapped() {
        UserDefaults.standard.set(2, forKey: kColorButton)
        updateColorsButtons()
    }

    @objc fileprivate func color3ButtonTapped() {
        UserDefaults.standard.set(3, forKey: kColorButton)
        updateColorsButtons()
    }

    @objc fileprivate func color4ButtonTapped() {
        UserDefaults.standard.set(4, forKey: kColorButton)
        updateColorsButtons()
    }

}
