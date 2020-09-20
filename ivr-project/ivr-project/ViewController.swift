//
//  ViewController.swift
//  ivr-project
//
//  Created by Ирина Ким on 07.09.2020.
//  Copyright © 2020 Kim Irina. All rights reserved.
//
 
import Foundation
import UIKit
 
class ViewController: UIViewController {
    
    lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Дневник+"
        label.textColor = UIColor(red: 0.17, green: 0.18, blue: 0.26, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var thirdVCButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Открыть калькулятор", for: .normal)
        button.setTitleColor(.init(red: 1, green: 1, blue: 1, alpha: 1.0), for: .normal)
        button.backgroundColor = UIColor(red: 0.85, green: 0.0, blue: 0.2, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showThirdVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
 
    lazy var segmentedController: UISegmentedControl = {
        let segmentedcontroller = UISegmentedControl(items:["Ученик", "Ученик лицея"])
        segmentedcontroller.backgroundColor = .init(red: 0.85, green: 0.0, blue: 0.2, alpha: 1)
        segmentedcontroller.addTarget(self, action: #selector(segmentControllerHandler), for: .valueChanged)
        segmentedcontroller.selectedSegmentIndex = 0
        segmentedcontroller.translatesAutoresizingMaskIntoConstraints = false
        return segmentedcontroller
    }()
 
    lazy var inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.backgroundColor = .init(red: 0.55, green: 0.6, blue: 0.68, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
 
    lazy var logInTextField: UITextField = {
        let textField = UITextField()
//      textField.backgroundColor = .init(red: 0.55, green: 0.6, blue: 0.68, alpha: 0.2)
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Login"
        return textField
    }()
 
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
//      textField.backgroundColor = .init(red: 0.55, green: 0.6, blue: 0.68, alpha: 0.2)
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
 
 
    @objc func segmentControllerHandler() {
        switch segmentedController.selectedSegmentIndex {
        case 0:
            thirdVCButtonTopAnchor?.isActive = false
            thirdVCButtonTopAnchor = thirdVCButton.topAnchor.constraint(equalTo: segmentedController.bottomAnchor, constant: 16.0)
            thirdVCButtonTopAnchor?.isActive = true
 
            thirdVCButton.setTitle("Калькулятор", for: .normal)
            hideInputViewController()
        case 1:
            thirdVCButtonTopAnchor?.isActive = false
            thirdVCButtonTopAnchor = thirdVCButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 16.0)
            thirdVCButtonTopAnchor?.isActive = true
 
            thirdVCButton.setTitle("Войти", for: .normal)
            showInputViewController()
        default :
            break
        }
 
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
 
    private var thirdVCButtonTopAnchor: NSLayoutConstraint?
 
    private func hideInputViewController() {
 
        UIView.animate(withDuration: 0.3, animations: {
            self.inputsContainerView.alpha = 0
            self.logInTextField.alpha = 0
            self.passwordTextField.alpha = 0
        }, completion: { _ in
            self.inputsContainerView.isHidden = true
            self.logInTextField.isHidden = true
            self.passwordTextField.isHidden = true
        })
 
    }
 
    private func showInputViewController() {
        UIView.animate(withDuration: 0.3, animations: {
            self.inputsContainerView.isHidden = false
            self.logInTextField.isHidden = false
            self.passwordTextField.isHidden = false
 
            self.inputsContainerView.alpha = 1
            self.logInTextField.alpha = 1
            self.passwordTextField.alpha = 1
        })
    }
 
    
    private func setupUI() {
        
        view.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.96, alpha: 1.0)
        inputsContainerView.addSubview(logInTextField)
        inputsContainerView.addSubview(passwordTextField)
        hideInputViewController()
        
        //Label
        appNameLabel.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 128.0).isActive = true
        appNameLabel.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        appNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0).isActive = true
        
        //Segment Control
        segmentedController.topAnchor.constraint(lessThanOrEqualTo: appNameLabel.bottomAnchor, constant: 16).isActive = true
        segmentedController.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        segmentedController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0).isActive = true
        segmentedController.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0).isActive = true
 
 
        //Inputs container
        inputsContainerView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor, constant: 8.0).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        inputsContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0).isActive = true
        inputsContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0).isActive = true
 
        //log in text field
        logInTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 0.0).isActive = true
        logInTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        logInTextField.leadingAnchor.constraint(equalTo: inputsContainerView.leadingAnchor, constant: 8.0).isActive = true
        logInTextField.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor, constant: -8.0).isActive = true
 
        //password text field
        passwordTextField.topAnchor.constraint(equalTo: logInTextField.bottomAnchor, constant: 8.0).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: inputsContainerView.leadingAnchor, constant: 8.0).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor, constant: -8.0).isActive = true
 
        //Button ThirdVC ОШИБКА
        thirdVCButton.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        thirdVCButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0).isActive = true
        thirdVCButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0).isActive = true
        thirdVCButtonTopAnchor = thirdVCButton.topAnchor.constraint(equalTo: segmentedController.bottomAnchor, constant: 16.0)
        thirdVCButtonTopAnchor?.isActive = true
 
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(appNameLabel)
        view.addSubview(segmentedController)
        view.addSubview(thirdVCButton)
        view.addSubview(inputsContainerView)
        
        setupUI()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
 
 
 
 
    @objc func showSecondVC() {
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        //        present(secondViewController, animated: true, completion: nil)
        navigationController?.pushViewController(secondViewController, animated: true)
    }
 
    @objc func showThirdVC() {
//      let thirdViewController = ThirdViewController()
//      thirdViewController.modalPresentationStyle = .fullScreen
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "3vc")
        present(vc, animated: true, completion: nil)
        //            navigationController?.pushViewController(thirdViewController, animated: true)
 
    }
 
}
