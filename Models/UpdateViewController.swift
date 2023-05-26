//
//  UpdateViewController.swift
//  Models
//
//  Created by DA MAC M1 133 on 2023/05/26.
//

import UIKit

class UpdateViewController: UIViewController {

    @IBOutlet weak var txtsalary: UITextField!
    @IBOutlet weak var txtrole: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtcontact: UITextField!
    @IBOutlet weak var txtsurname: UITextField!
    
    var empsurname : String?
    var empnumber : String?
      var empemail : String?
      var emprole : String?
      var empsalary : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtsurname.text = empsurname
        txtcontact.text = empnumber
        txtemail.text = empemail
        txtrole.text = emprole
        txtsalary.text = empsalary
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
