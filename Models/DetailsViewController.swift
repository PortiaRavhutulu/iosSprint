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
    
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var salary: UILabel!
    @IBOutlet weak var cellNumber: UILabel!
    @IBOutlet weak var lastName: UILabel!
    var titleDets: String?
    var lName: String?
    var cellNum: String?
    var empEmail: String?
    var empRole: String?
    var empSalary: String?
    var num: String?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        number.text = num
        titleDetails.text = titleDets
        lastName.text = lName
        cellNumber.text = cellNum
        email.text = empEmail
        role.text = empRole
        salary.text = empSalary
    }
    
    @IBAction func btnupdate(_ sender: Any) {
        
        let up = self.storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as? UpdateViewController
               
        up?.empid = num
        up?.empname = titleDets
        up?.empsurname = lName!
               up?.empnumber = cellNum!
               up?.empemail = empEmail!
               up?.emprole = empRole!
               up?.empsalary = empSalary!
       //        print(titleDets!)
               
               self.navigationController?.pushViewController(up!, animated: true)
        
        
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
