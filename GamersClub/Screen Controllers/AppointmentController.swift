//
//  AppointmentController.swift
//  GamersClub
//
//  Created by Egor Ilchenko on 12/17/24.
//

import Foundation
import UIKit

class AppointmentController: UIViewController {
    // MARK: - UI element declaration
    private let topContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 40
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackNameView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        return label
    }()
    
    private let textFieldName: UITextField = {
        let text = UITextField()
        text.keyboardType = .default
        text.placeholder = "Input player name"
        return text
    }()
    
    private let stackDateView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date:"
        return label
    }()
    
    private let textFieldDate: UITextField = {
        let text = UITextField()
        text.placeholder = "Input game date"
        text.keyboardType = .numbersAndPunctuation
        //  text.inputView = datePicker
        return text
    }()
    
    //    private let datePicker: UIDatePicker = {
    //        let picker = UIDatePicker()
    //        picker.translatesAutoresizingMaskIntoConstraints = false
    //        picker.preferredDatePickerStyle = .wheels
    //        return picker
    //    }()
    
    private let stackGameView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let gameLabel: UILabel = {
        let label = UILabel()
        label.text = "Game:"
        return label
    }()
    
    private lazy var gamePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private lazy var textFieldGame: UITextField = {
        let text = UITextField()
        text.placeholder = "Input game"
        text.inputView = gamePicker
        text.delegate = self
        return text
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
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.shadowColor = UIColor.red.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        return button
    }()
    
    private let createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.shadowColor = UIColor.green.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
  //  let gameManager = GameManager()
    var chosenName: String = ""
    var chosenDate: String = ""
    var chosenGame: String = ""
    
    // MARK: - Lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - UI configuration
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(topContainer)
        topContainer.addArrangedSubview(backButton)
        topContainer.addArrangedSubview(clearButton)
        
        NSLayoutConstraint.activate([
            topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            topContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            topContainer.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(stackNameView)
        stackNameView.addArrangedSubview(nameLabel)
        stackNameView.addArrangedSubview(textFieldName)
        NSLayoutConstraint.activate([
            stackNameView.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 60),
            stackNameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        
        view.addSubview(stackDateView)
        stackDateView.addArrangedSubview(dateLabel)
        stackDateView.addArrangedSubview(textFieldDate)
        NSLayoutConstraint.activate([
            stackDateView.topAnchor.constraint(equalTo: stackNameView.bottomAnchor, constant: 10),
            stackDateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        
        view.addSubview(stackGameView)
        stackGameView.addArrangedSubview(gameLabel)
        stackGameView.addArrangedSubview(textFieldGame)
        NSLayoutConstraint.activate([
            stackGameView.topAnchor.constraint(equalTo: stackDateView.bottomAnchor, constant: 10),
            stackGameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        
        view.addSubview(createButton)
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: textFieldGame.bottomAnchor, constant: 170),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.widthAnchor.constraint(equalToConstant: 150),
            createButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(recognizer)
        
        let backAction = UIAction { _ in
            self.backPushed()
        }
        let clearAction = UIAction { _ in
            self.clearPushed()
        }
        let createAction = UIAction { _ in
            self.createPushed()
        }
        
        backButton.addAction(backAction, for: .touchUpInside)
        clearButton.addAction(clearAction, for: .touchUpInside)
        createButton.addAction(createAction, for: .touchUpInside)
        addDoneButtonToTextfield(to: textFieldName)
        addDoneButtonToTextfield(to: textFieldDate)
        addDoneButtonToTextfield(to: textFieldGame)
    }
    // MARK: - View functions
    private func backPushed() {
        print()
        navigationController?.popViewController(animated: true)
    }
    
    private func clearPushed() {
        textFieldName.text = nil
        textFieldDate.text = nil
        textFieldGame.text = nil
    }
    private func createPushed() {
        
        if let name = textFieldName.text, !name.isEmpty,
           let date = textFieldDate.text, !date.isEmpty,
           let game = textFieldGame.text, !game.isEmpty {
            GameManager.shared.appointmentArray.append(
                Appointment(playerName: name, gameDate: date, game: game)
            )
            textFieldName.text = nil
            textFieldDate.text = nil
            textFieldGame.text = nil
            appointmentCreatedAlert(name: name)
        } else {
            showFillDataAlert()
        }
        
        
    }
    
    private func addDoneButtonToTextfield(to textField: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        toolbar.items = [flexibleSpace, doneButton]
        textField.inputAccessoryView = toolbar
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    private func showFillDataAlert () {
        let alert = UIAlertController(title: "Atention", message: "You have to fill out all the fields", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert,animated: true)
    }
    private func appointmentCreatedAlert(name: String) {
        let alert = UIAlertController(title: "Created", message: "Appointment for \(name) created", preferredStyle: .alert)
        present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
// MARK: - Extension
extension AppointmentController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GameManager.shared.gameArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return GameManager.shared.gameArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFieldGame.text = GameManager.shared.gameArray[row]
        chosenGame = GameManager.shared.gameArray[row]
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
}
