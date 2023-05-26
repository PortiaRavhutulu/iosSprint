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

        let str = empsurname
        let split = str!.split(separator: " ")
        let last    = String(split.suffix(1).joined(separator: [" "]))
        let lastTwo = String(split.suffix(2).joined(separator: [" "]))

        // Do any additional setup after loading the view.
        txtsurname.text = String(empsurname!.split(separator: " ").suffix(1).joined(separator: [" "]))
        txtcontact.text = String(empnumber!.split(separator: " ").suffix(1).joined(separator: [" "]))
        txtemail.text = String(empemail!.split(separator: " ").suffix(1).joined(separator: [" "]))
        txtrole.text = String(emprole!.split(separator: " ").suffix(1).joined(separator: [" "]))
        txtsalary.text = String(empsalary!.split(separator: " ").suffix(1).joined(separator: [" "]))
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
