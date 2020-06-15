//
//  PresenciaisViewController.swift
//  NavigationAula
//
//  Created by Arthur Rodrigues on 18/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class PresenciaisViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var porQuem = ["Por João", "Por Arthur", "Por Kewin","Por João", "Por Arthur", "Por Kewin","Por João"]
    
    var porQuem2 = ["Por Arthur", "Por Kewin", "Por João"]
    
    var nomesDosPresenciais = ["Data Science","Automação","MongoDB","SQL",
                               "Python","PowerBI","R"]
    
    var confirmed = [UIImage(named: ""), UIImage(named: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(_:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(_:)))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func swipeLeft(_ gesture: UISwipeGestureRecognizer) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            segmentedControl.selectedSegmentIndex = 1
            tableView.reloadData()
        } else {
            return
        }
    }
    
    @objc func swipeRight(_ gesture: UISwipeGestureRecognizer) {
        
        if segmentedControl.selectedSegmentIndex == 1 {
            segmentedControl.selectedSegmentIndex = 0
            tableView.reloadData()
        } else {
            return
        }
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detail",
            let detailVC = segue.destination as? DetailViewController {
            if let detailIndex = sender as? Int {
                detailVC.auxTitle =  nomesDosPresenciais[detailIndex]
            }
        }
        
    }
    
}


extension PresenciaisViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0{
            return nomesDosPresenciais.count
        } else {
            return porQuem2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "presencialID") as! PresencialTableViewCell
        
        if segmentedControl.selectedSegmentIndex == 0 {
        
            cell.nomeLbl.text = nomesDosPresenciais[indexPath.row]
            
            cell.porLbl.text = porQuem[indexPath.row]
            
            cell.confirmedOrNot.image = UIImage(named: "Não Confirmado")
            
        } else {
            
            cell.nomeLbl.text = nomesDosPresenciais[indexPath.row]
            
            cell.porLbl.text = porQuem[indexPath.row]
            
            cell.confirmedOrNot.image = UIImage(named: "Confirmado")
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "detail", sender: indexPath.row)
        
    }
    
    
}
