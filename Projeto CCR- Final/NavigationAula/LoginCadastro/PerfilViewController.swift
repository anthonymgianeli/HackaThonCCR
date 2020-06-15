//
//  SimpleViewController.swift
//  NavigationAula
//
//  Created by Luma Gabino Vasconcelos on 06/05/19.
//  Copyright © 2019 Anthony Marques Gianeli. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PerfilViewController: BaseViewController {

    
    var labelAtCell = ["Notificações",
                       "Configurações", "Ajuda Profisional", "Ajuda", "Sair da Conta"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var jobRoleLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    override var name: String {
        get {
            return "Simple View Controller"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        post()
        setupLabels()
    }
    
    func setupLabels() {
        
        self.nameLbl.text = "Anthony Marques Gianeli"
        self.jobRoleLbl.text = "Caminhoneiro"
        self.profileImage.image = UIImage(named: "anthony")
    }
    
        func post (){
            let title = "firebase"
            let subtitle = "ola"

            let post :[String: AnyObject] = ["title" : title as AnyObject, "subtitle" : subtitle as AnyObject]

            let dbReference = Database.database().reference()
            dbReference.child("Posts").childByAutoId().setValue(post)
        }
    
    func resetUser() {
        // create the alert
        let alert = UIAlertController(title: "Ah que pena!", message: "Você tem certeza que deseja sair?", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "QUERO SAIR", style: UIAlertAction.Style.default, handler: { action in
            self.logout()
        }))
        alert.addAction(UIAlertAction(title: "NÃO", style: UIAlertAction.Style.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

    func logout() {
        
        resetDefaults()
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        defaults.synchronize()
    }
}

extension PerfilViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelAtCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewID") as!  PerfilTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.label.textColor = UIColor(displayP3Red: 76.0/255.0, green: 27.0/255.0, blue: 153.0/255.0, alpha: 1.0)
        case 5:
            cell.label.textColor = UIColor(displayP3Red: 76.0/255.0, green: 27.0/255.0, blue: 153.0/255.0, alpha: 1.0)
        default:
            print("change color error")
        }
        
        cell.label.text = labelAtCell[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 6:
            resetUser()
        default:
            break
        }
    }
}

extension  UIViewController {
    
    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
        })
        alert.addAction(ok)
        alert.addAction(cancel)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
