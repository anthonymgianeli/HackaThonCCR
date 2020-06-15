//
//  VideoViewController.swift
//  NavigationAula
//
//  Created by João Victor Batista on 18/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    var auxThumb : UIImage?
    var auxTitle : String?
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        thumb.image = auxThumb
        name.text = auxTitle
        navItem.title = auxTitle
        
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
