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
    
    var empid : String?
    var empname : String?
    var fname : String?
    var empsurname : String?
    var empnumber : String?
      var empemail : String?
      var emprole : String?
      var empsalary : String?
    var numberid : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let str = empsurname
//        let split = str!.split(separator: " ")
//        let last    = String(split.suffix(1).joined(separator: [" "]))
//        let lastTwo = String(split.suffix(2).joined(separator: [" "]))

        // Do any additional setup after loading the view.
        
        
        numberid = Int(String(empid!.split(separator: " ").suffix(1).joined(separator: [" "])))
        fname = String(empname!.split(separator: " ").suffix(1).joined(separator: [" "]))
        txtsurname.text = String(empsurname!.split(separator: " ").suffix(1).joined(separator: [" "]))
        txtcontact.text = String(empnumber!.split(separator: " ").suffix(1).joined(separator: [" "]))
        txtemail.text = String(empemail!.split(separator: " ").suffix(1).joined(separator: [" "]))
        txtrole.text = String(emprole!.split(separator: " ").suffix(1).joined(separator: [" "]))
        txtsalary.text = String(empsalary!.split(separator: " ").suffix(1).joined(separator: [" "]))
    }
    
    @IBAction func btnup(_ sender: Any) {
        putRequest()
        createSuccessAlert()
    }
    
    func putRequest() {

        // declare the parameter as a dictionary that contains string as key and value combination. considering inputs are valid
        let employee: Employee = Employee(empId: Int(0), empName: "\(fname ?? "value")", empLastName: "\(txtsurname.text ?? "value")", cellNumber: "\(txtcontact.text ?? "value")", email: "\(txtemail.text ?? "value")", role: "\(txtrole.text ?? "value")", salary: Int(txtsalary.text ?? "value") ?? 0)
        let parameters: [String: Any] = ["empName": employee.empName, "empLastName": employee.empLastName, "cellNumber": employee.cellNumber, "email": employee.email, "role": employee.role, "salary": employee.salary]

        // create the url with URL
        let url = URL(string: "http://localhost:8080/employee/updateEmployee/\(numberid ?? 0)")! // change server url accordingly

        // create the session object
        let session = URLSession.shared

        // now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "PUT" //set http method as POST

        // add headers for the request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        do {
            // convert parameters to Data and assign dictionary to httpBody of request
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return
        }

        // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request) { data, response, error in

            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
            }

            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
                print("Invalid Response received from the server")
                return
            }

            // ensure there is data returned
            guard let responseData = data else {
                print("nil Data received from the server")
                return
            }

            do {
                // create json object from data or use JSONDecoder to convert to Model stuct
                if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
                    print(jsonResponse)
                    // handle json response
                } else {
                    print("data maybe corrupted or in wrong format")
                    throw URLError(.badServerResponse)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        // perform the task
        task.resume()
    }

    func createSuccessAlert() {
        let alert = UIAlertController(title: "Success", message: "User successfully updated", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in print("OK tap")}))
        
        present(alert, animated: true, completion: nil)
    }
    

    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */

}
