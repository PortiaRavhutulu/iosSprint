//
//  AddEmployeeVC.swift
//  Models
//
//  Created by DA MAC M1 155 on 2023/05/25.
//

import UIKit

class AddEmployeeVC: UIViewController {

   
   
    @IBOutlet weak var salary: UITextField!
    @IBOutlet weak var role: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var cellNumber: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnAddEmployee(_ sender: UIButton) {
        postRequest()
    }
    
    func postRequest() {
      
      // declare the parameter as a dictionary that contains string as key and value combination. considering inputs are valid
        let employee: Employee = Employee(empId: Int(0), empName: "\(firstName.text ?? "value")", empLastName: "\(lastName.text ?? "value")", cellNumber: "\(cellNumber.text ?? "value")", email: "\(email.text ?? "value")", role: "\(role.text ?? "value")", salary: Int(salary.text ?? "value") ?? 0)
        let parameters: [String: Any] = ["empName": employee.empName, "empLastName": employee.empLastName, "cellNumber": employee.cellNumber, "email": employee.email, "role": employee.role, "salary": employee.salary]
      
      // create the url with URL
      let url = URL(string: "http://localhost:8080/employee/addEmployee")! // change server url accordingly
      
      // create the session object
      let session = URLSession.shared
      
      // now create the URLRequest object using the url object
      var request = URLRequest(url: url)
      request.httpMethod = "POST" //set http method as POST
      
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
