//
//  ChildViewController.swift
//  NavigationAula
//
//  Created by Luma Gabino Vasconcelos on 06/05/19.
//  Copyright © 2019 Anthony Marques Gianeli. All rights reserved.
//

import UIKit

class DetalhesEventosViewController: BaseViewController {
    var text: String?
    var image : UIImage?
    
    @IBOutlet weak var informacao: UILabel!
    @IBOutlet weak var descricao: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var signButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagem.image = image
        signButton.layer.cornerRadius = 20
        signButton.clipsToBounds = true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    override var name: String{
        get{
            return "MainViewController"
        }
    }
    
    override var myOutlet: UIView? {
        get{
            return descricao
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        descricao.text = text
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
