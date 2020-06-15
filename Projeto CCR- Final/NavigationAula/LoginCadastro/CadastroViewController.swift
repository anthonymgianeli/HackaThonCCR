//
//  CadastroViewController.swift
//  NavigationAula
//
//  Created by anthony gianeli on 08/05/19.
//  Copyright © 2019 Anthony Marques Gianeli. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class CadastroViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var idadeTextField: UITextField!
    @IBOutlet weak var ra: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var finalizarButton: UIButton!
    
    var handle: AuthStateDidChangeListenerHandle?
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            post()
        self.hideKeyboardWhenTappedAround()
        
        setupKeyboardNotification()
        
        nameTextField.delegate = self
        enderecoTextField.delegate = self
        idadeTextField.delegate = self
        cpfTextField.delegate = self
        ra.delegate = self

        
        finalizarButton.layer.cornerRadius = 5
        finalizarButton.clipsToBounds = true
        
        nameTextField.endEditing(true)
        enderecoTextField.endEditing(true)
        idadeTextField.endEditing(true)
        cpfTextField.endEditing(true)
        ra.endEditing(true)
        
        // Do any additional setup after loading the view.
        finalizarButton.clipsToBounds = true
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        let user = Auth.auth().currentUser
        if let user = user {
            // Pega id do usuario atual
            let uID = user.uid
            
            
            // salva no bd
            ref?.child("User").child(uID).child("nome").setValue(nameTextField.text)
            ref?.child("User").child(uID).child("idade").setValue(idadeTextField.text)
            ref?.child("User").child(uID).child("endereco").setValue(enderecoTextField.text)
//            ref?.child("User").child(uID).child("cpf").setValue(cpfTextField.text)
        }
    }

    func post (){
        let title = "firebase"
        let subtitle = "ola"
        
        let post :[String: AnyObject] = ["title" : title as AnyObject, "subtitle" : subtitle as AnyObject]
        
        let dbReference = Database.database().reference()
        dbReference.child("Posts").childByAutoId().setValue(post)
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
            scrollView.contentOffset = CGPoint(x: 0, y:  keyboardRectInSuperView.height - view.safeAreaInsets.bottom - 130)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @objc func endSelection(_ force: Bool) -> Bool {
        return self.view.endEditing(force)
    }
}
