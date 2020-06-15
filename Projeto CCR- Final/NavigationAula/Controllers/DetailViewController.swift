//
//  DetailViewController.swift
//  NavigationAula
//
//  Created by Arthur Rodrigues on 18/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    var auxTitle: String?
    
    var sections = "Mais de João"
    
    var otherNames = ["Introdução Acrobat", "Introdução Acrobat", "Introdução Acrobat", "Introdução Acrobat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = auxTitle
    }
    

}


extension DetailViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return otherNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "others") as! DetailTableViewCell
        
        cell.otherNames.text = self.otherNames[indexPath.row]
        
        return cell
        
    }
    
    
    
    
}
