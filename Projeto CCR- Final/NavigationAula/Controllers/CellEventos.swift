//
//  CellEventos.swift
//  NavigationAula
//
//  Created by anthony gianeli on 09/05/19.
//  Copyright © 2019 Anthony Marques Gianeli. All rights reserved.
//

import UIKit

class CellEventos: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var descricao: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
