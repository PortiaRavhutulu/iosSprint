//
//  DetailsViewController.swift
//  Models
//
//  Created by DA MAC M1 125 on 2023/05/24.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleDetails: UILabel!
    @IBOutlet weak var number: UILabel!
    
    var titleDets: String?
    var num: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        number.text = num
        titleDetails.text = titleDets
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
