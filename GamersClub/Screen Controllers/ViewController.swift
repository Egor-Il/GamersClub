//
//  ViewController.swift
//  GamersClub
//
//  Created by Egor Ilchenko on 12/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let menuImage: UIImageView = {
        let menuView = UIImageView()
        menuView.image = UIImage(named: "mainMenuComputer")
        menuView.contentMode = .scaleAspectFit
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.layer.cornerRadius = 15
        menuView.clipsToBounds = true
        return menuView
    }()
    
    private let stackButtonView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 60
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let appointmentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create appointment", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.shadowColor = UIColor.green.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        return button
    }()
    
    private let findPlayerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Find player", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.shadowColor = UIColor.green.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    private func configureUI() {
        view.backgroundColor = .gray
        view.addSubview(menuImage)
        
        let menuImageHight = view.frame.height / 3
        
        NSLayoutConstraint.activate([
            menuImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            menuImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuImage.heightAnchor.constraint(equalToConstant: menuImageHight),
            menuImage.widthAnchor.constraint(equalToConstant: menuImageHight)
        ])
        
        view.addSubview(stackButtonView)
        
        NSLayoutConstraint.activate([
            stackButtonView.topAnchor.constraint(equalTo: menuImage.bottomAnchor, constant: 60),
            stackButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        stackButtonView.addArrangedSubview(appointmentButton)
        stackButtonView.addArrangedSubview(findPlayerButton)
        
        appointmentButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        appointmentButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        findPlayerButton.widthAnchor.constraint(equalTo: appointmentButton.widthAnchor).isActive = true
        findPlayerButton.heightAnchor.constraint(equalTo: appointmentButton.heightAnchor).isActive = true

        let appointmentAction = UIAction { _ in
            self.appointmentPressed()
        }
        let findAction = UIAction { _ in
            self.findPressed()
        }
        
        appointmentButton.addAction(appointmentAction, for: .touchUpInside)
        findPlayerButton.addAction(findAction, for: .touchUpInside)
    }
    
    private func appointmentPressed() {
        let controller = AppointmentController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    private func findPressed() {
        let controller = FinderController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

