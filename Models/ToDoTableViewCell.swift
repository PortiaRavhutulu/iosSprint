//
//  ToDoTableViewCell.swift
//  Models
//
//  Created by DA MAC M1 125 on 2023/05/24.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
   

    @IBOutlet weak var id: UILabel!
    

    @IBOutlet weak var salary: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var cellNumber: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
