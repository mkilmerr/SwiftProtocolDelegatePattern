//
//  ProfileViewController.swift
//  ProtocolDemo
//
//  Created by Alex Nagy on 07/12/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import UIKit

let kIconButton = "kIconButton"
let kColorButton = "kColorButton"

class ProfileViewController: UIViewController {
    
    lazy var settingsBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(settingsBarButtonItemTapped))
    
    @objc fileprivate func settingsBarButtonItemTapped() {
        let controller = SettingsViewController()
        controller.settingsViewControllerDelegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    lazy var iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.systemGray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupNavigation()
        setupView()
        loadDefaultProfile()
    }
    
    fileprivate func setupNavigation() {
        title = "Profile"
        navigationItem.setRightBarButton(settingsBarButtonItem, animated: false)
    }
    
    fileprivate func setupView() {
        guard let view = view else { return }
        
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(iconImageView)
        view.addSubview(nameLabel)
        view.addSubview(infoLabel)
        
        iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 16).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: iconImageView.centerXAnchor).isActive = true
        
        infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
    }
    
    fileprivate func loadDefaultProfile() {
        let defaultProfile = Profile(icon: "icon2", accentColor: UIColor.systemOrange, name: "Apple", info: "Builder of iPhones")
        UserDefaults.standard.set(2, forKey: kIconButton)
        UserDefaults.standard.set(4, forKey: kColorButton)
        apply(defaultProfile)
    }
    
    func apply(_ profile: Profile) {
        iconImageView.image = UIImage(named: profile.icon)?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = profile.accentColor
        nameLabel.text = profile.name
        infoLabel.text = profile.info
    }

}

extension ProfileViewController:SettingsViewControllerDelegate{
    func didChange(_ profile: Profile) {
        self.apply(profile)
    }
}
