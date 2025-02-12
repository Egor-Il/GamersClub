//
//  GameViewController.swift
//  GamersClub
//
//  Created by Egor Ilchenko on 1/4/25.
//

import UIKit

class GameViewController: UIViewController {
    // MARK: - UI element declaration
    private let gameScreen: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let homeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Home", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.shadowColor = UIColor.systemBlue.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var gamePic: String = ""
    // MARK: - Lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    // MARK: - UI configuration
    private func configureUI () {
        view.backgroundColor = .gray
        view.addSubview(gameScreen)
        view.addSubview(homeButton)
        
        if let gameImageName = GameManager.shared.gamePicDic[gamePic] {
            gameScreen.image = UIImage(named: gameImageName)
        } else {
            gameScreen.backgroundColor = .red
        }
    
        NSLayoutConstraint.activate([
            gameScreen.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            gameScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            gameScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            gameScreen.heightAnchor.constraint(equalToConstant: 400)
        ])
        NSLayoutConstraint.activate([
            homeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeButton.widthAnchor.constraint(equalToConstant: 80),
            homeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let homeAction = UIAction { _ in
            self.homePushed()
        }
        homeButton.addAction(homeAction, for: .touchUpInside)
    }
    // MARK: - View functions
    private func homePushed() {
        navigationController?.popToRootViewController(animated: true)
    }
}
