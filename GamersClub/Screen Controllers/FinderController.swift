//
//  FinderController.swift
//  GamersClub
//
//  Created by Egor Ilchenko on 12/17/24.
//

import Foundation
import UIKit

class FinderController: UIViewController {
    // MARK: - UI element declaration
    private let topContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.shadowColor = UIColor.systemBlue.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false // ПОЧЕМУ НАДО У КНОПКИ ОТКЛЮЧАТЬ КОГДА Я ОТКЛЮЧИЛ У САБ ВЬЮ?
        return button
    }()
    
    private let finderContainer: UIStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.distribution = .fillProportionally
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var playerNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Put player name"
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let findButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Find", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.shadowColor = UIColor.green.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false // ПОЧЕМУ НАДО У КНОПКИ ОТКЛЮЧАТЬ КОГДА Я ОТКЛЮЧИЛ У САБ ВЬЮ?
        return button
    }()
    
    private let playerInfoStack: UIStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.distribution = .fillEqually
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name: "
        return label
    }()
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date: "
        return label
    }()
    private let gameLabel: UILabel = {
        let label = UILabel()
        label.text = "Game: "
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.shadowColor = UIColor.green.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false // ПОЧЕМУ НАДО У КНОПКИ ОТКЛЮЧАТЬ КОГДА Я ОТКЛЮЧИЛ У САБ ВЬЮ?
        button.isHidden = true
        return button
    }()
    
    
  //  let gameManager = GameManager()
    var gameForAppointment: String = ""
    
    // MARK: - Lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - UI configuration
    private func configureUI() {
       
        view.backgroundColor = .systemBackground
        view.addSubview(topContainer)
        topContainer.addSubview(backButton)
        view.addSubview(finderContainer)
        finderContainer.addArrangedSubview(playerNameTextField)
        finderContainer.addArrangedSubview(findButton)
        view.addSubview(playerInfoStack)
        playerInfoStack.addArrangedSubview(nameLabel)
        playerInfoStack.addArrangedSubview(dateLabel)
        playerInfoStack.addArrangedSubview(gameLabel)
        view.addSubview(playButton)
        
        NSLayoutConstraint.activate([
            topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            topContainer.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor, constant: 40),
            backButton.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            finderContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 20),
            finderContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            finderContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            playerInfoStack.topAnchor.constraint(equalTo: finderContainer.bottomAnchor, constant: 20),
            playerInfoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: playerInfoStack.bottomAnchor, constant: 100),
            playButton.widthAnchor.constraint(equalToConstant: 80),
            playButton.heightAnchor.constraint(equalToConstant: 40),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(recognizer)
        
        let backAction = UIAction { _ in
            self.backPushed()
        }
        let findAction = UIAction { _ in
            self.findPushed()
        }
        let playAction = UIAction { _ in
            self.playPushed()
        }
        backButton.addAction(backAction, for: .touchUpInside)
        findButton.addAction(findAction, for: .touchUpInside)
        playButton.addAction(playAction, for: .touchUpInside)
    }
    // MARK: - View functions
    private func backPushed() {
        navigationController?.popViewController(animated: true)
    }
    private func findPushed() {
        
        if let playerName = GameManager.shared.appointmentArray.first(where: { $0.playerName == playerNameTextField.text }) {
            nameLabel.text = "Name: \(playerName.playerName)"
            dateLabel.text = "Date: \(playerName.gameDate)"
            gameLabel.text = "Game: \(playerName.game)"
            gameForAppointment = playerName.game
            playButton.isHidden = false
            gameForAppointment = playerName.game
        } else {
            notFoundAlert()
        }
        view.endEditing(true)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)  // почему не срабатывает resignFirstResponder()
        
    }
    
    private func notFoundAlert() {
        if  let name = playerNameTextField.text, !name.isEmpty {
            let alert = UIAlertController(title: "Not found", message: "Name: \(name) - Not found", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .cancel)
            alert.addAction(okAction)
            present(alert,animated: true)
        } else {
            return
        }
    }
    
    private func playPushed() {
        let controller = GameViewController()
        controller.gamePic = gameForAppointment
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
// MARK: - Extension
extension FinderController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        findPushed()
        return true
    }
    
}

