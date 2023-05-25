//
//  ToDoViewController.swift
//  Models
//
//  Created by DA MAC M1 125 on 2023/05/24.
//

import UIKit

class ToDoViewController: UIViewController {
    //var array = ["A", "B", "C"]
    var searchingArray = [Employee]()
    var searching = false
    var array = [Employee]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchApiData(URL: "http://localhost:8080/employee/getEmployees") { result in
            self.array = result
            
//            print(result)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchApiData(URL url: String , completion: @escaping([Employee]) -> Void){
        let url = URL(string: url)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if data != nil && error == nil {
                do {
                    let parsingData = try JSONDecoder().decode([Employee].self, from: data!)
                    completion(parsingData)
                } catch {
                    print("parsing error")
                }
            }
            
        }
        dataTask.resume()
        
    }
    
}
    
    //MARK: - TableView Methods
    
extension ToDoViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchingArray.count
        } else {
            return array.count
        }
        // return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as? ToDoTableViewCell
        else {return UITableViewCell()}
        if searching {
            cell.textLabel?.text = "\(searchingArray[indexPath.row].empName)"
        } else {
            cell.id.text = "\(array[indexPath.row].empId)"
            cell.title.text = array[indexPath.row].empName
            //cell.id.text = String(data[indexPath.row].id)
            cell.lastName.text = "\(array[indexPath.row].empLastName)"
            cell.cellNumber.text = "\(array[indexPath.row].cellNumber)"
            cell.email.text = "\(array[indexPath.row].email)"
            cell.role.text = "\(array[indexPath.row].role)"
            cell.salary.text = "\(array[indexPath.row].salary)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        array.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingArray = array.filter({$0.empName.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        
        vc?.num = "\(array[indexPath.row].empId)"
        vc?.titleDets = array[indexPath.row].empName
        vc?.lName = array[indexPath.row].empLastName
        vc?.cellNum = array[indexPath.row].cellNumber
        vc?.empEmail = array[indexPath.row].email
        vc?.empRole = array[indexPath.row].role
        vc?.empSalary = "R \(array[indexPath.row].salary)"
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}

