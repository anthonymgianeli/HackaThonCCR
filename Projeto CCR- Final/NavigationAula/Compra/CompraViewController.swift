//
//  CompraViewController.swift
//  NavigationAula
//
//  Created by anthony gianeli on 10/05/19.
//  Copyright © 2019 Anthony Marques Gianeli. All rights reserved.
//

import UIKit

class CompraViewController: BaseViewController {

    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var myStepper2: UIStepper!
    @IBOutlet weak var myStepper3: UIStepper!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var totalPista: Double = 0
    var totalVip: Double = 0
    var totalCamarote: Double = 0
    var totalGeral: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signButton.layer.cornerRadius = 20
        signButton.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func myStepperAction(_ sender: Any) {
        
        myLabel.text = String (Int (myStepper.value))
        totalPista = myStepper.value * 20.00
        self.calculaTotalGeral()
        
    }
    
    @IBAction func myStepperAction2(_ sender: Any) {
        myLabel2.text = String (Int (myStepper2.value))
        totalVip = myStepper2.value * 30.00
        self.calculaTotalGeral()
    }
    
    @IBAction func myStepper3(_ sender: Any) {
        myLabel3.text = String (Int (myStepper3.value))
        totalCamarote = myStepper3.value * 40.00
        self.calculaTotalGeral()
    }
    
    func calculaTotalGeral() {
        totalGeral = totalPista + totalVip + totalCamarote
        totalLabel.text = "\(totalGeral)"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
