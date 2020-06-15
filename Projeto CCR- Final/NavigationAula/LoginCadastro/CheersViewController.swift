//
//  CheersViewController.swift
//  NavigationAula
//
//  Created by anthony gianeli on 14/06/20.
//  Copyright © 2020 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class CheersViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var eatView: UIView!
    @IBOutlet weak var physicalActivityView: UIView!
    @IBOutlet weak var firstAidView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            eatView.isHidden = false
            physicalActivityView.isHidden = true
            firstAidView.isHidden = true
        case 1:
            eatView.isHidden = true
            physicalActivityView.isHidden = false
            firstAidView.isHidden = true
        case 2:
            eatView.isHidden = true
            physicalActivityView.isHidden = true
            firstAidView.isHidden = false
        default:
            break
        }
    }
}
