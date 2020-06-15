//
//  MentorTableViewCell.swift
//  NavigationAula
//
//  Created by João Victor Batista on 17/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class MentorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var curso: UILabel!
    @IBOutlet weak var autor: UILabel!
    @IBOutlet weak var play: UIImageView!
    @IBOutlet weak var progress: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
