//
//  LoginViewController.swift
//  NavigationAula
//
//  Created by anthony gianeli on 08/05/19.
//  Copyright © 2019 Anthony Marques Gianeli. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var signSelector: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.hideKeyboardWhenTappedAround()
        passwordTextField.delegate = self
        emailTextField.delegate = self
        setupKeyboardNotification()
        
        // Do any additional setup after loading the view.
        signButton.layer.cornerRadius = 5
        signButton.clipsToBounds = true
        
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewController.endSelection(_:))))
    }
    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        // flip the boolean
        isSignIn = !isSignIn
        
        // check the bool and set the button and labels
        if isSignIn {
            signButton.setTitle("     Entrar     ", for: .normal)
        } else {
            signButton.setTitle("     Cadastrar    ", for: .normal)
        }
    }
    
    @IBAction func signInTappedButton(_ sender: UIButton) {
        // TODO: do some form validation
        if let email = emailTextField.text, let pass = passwordTextField.text {
            // check if it`s sign in or register
            if isSignIn {
                // sign in the user with Firebase
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    
                    // check that isn`t nil
                    if let u = user {
                        // user is found, go to home screen
                        self.performSegue(withIdentifier: "entrarHome", sender: self)
                    }
                    else {
                        // error: check error and show message
                        return
                    }
                })
                
            } else {
                // register the user with Firebase
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    
                    // check that isn`t nil
                    if let u = user {
                        // user is found, go to home screen
                        self.performSegue(withIdentifier: "entrarCadastro", sender: self)
                    }
                    else {
                        // error: check error and show message
                        return
                    }
                })
            }
        }
    }
    
    func setupKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(resizeTableView), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resizeTableView), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    
    @objc func resizeTableView(_ notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardRect = keyboardValue.cgRectValue
        let keyboardRectInSuperView = scrollView.convert(keyboardRect, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        }
        else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardRectInSuperView.height - view.safeAreaInsets.bottom, right: 0)
            scrollView.contentOffset = CGPoint(x: 0, y:  keyboardRectInSuperView.height - view.safeAreaInsets.bottom)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @objc func endSelection(_ force: Bool) -> Bool {
        return self.view.endEditing(force)
    }

    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
        
    }
}
