

import UIKit
protocol ChecklistDelegate {
    
    func didDelegate(data: [String])
    
}

class TableViewController: UITableViewController, UITextFieldDelegate {
    
    let row0text = "Addition (+)"
    let row1text = "Substraction (-)"
    let row2text = "Multiplication (*)"
    
    var allOperators = ["+", "-", "*"]
    
    var delegate: ChecklistDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = row0text
        }
        else if indexPath.row == 1 {
            label.text = row1text
        }
            
        else if indexPath.row == 2 {
            label.text = row2text
        }
            
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                
            } else {
                cell.accessoryType = .none
                allOperators.remove(at: indexPath.row)
               
                
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func done(_ sender: Any) {
        
        if delegate != nil{
            print(allOperators)
            delegate?.didDelegate(data: allOperators)
            dismiss(animated: true, completion: nil)
        }
        
        
    }
   
}
