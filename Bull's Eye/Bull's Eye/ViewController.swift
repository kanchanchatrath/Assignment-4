//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Kanchan chatrath on 1/15/19.
//  Copyright © 2019 Kanchan chatrath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ChecklistDelegate {
    
    
    
    func didDelegate(data: [String]) {
        
        oper = data
        index = data.count
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show"{
            let tableView: TableViewController = segue.destination as! TableViewController
            tableView.delegate = self
        }
    }
    

    
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var randomope: UILabel!
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    
    var caseresult = 0
//    var resultfield:Int = 0 don't need
    var randomnumber1:Int = 0
    var randomnumber2:Int = 0
    var updatescore = 0
    var updateround = 0
    var oper:[String] = ["+","-","*"]
    var operIndex:Int = 0
    var index:Int = 3
    var questionscount: Int = 0
    var mimimumLevel: Int = 2
    var level:Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        randomnumber1 = Int((arc4random_uniform(10)))
        number1.text = "\(randomnumber1)"
        randomnumber2 = Int((arc4random_uniform(10)))
        number2.text = "\(randomnumber2)"
        operIndex = Int((arc4random_uniform(UInt32(index))))
        randomope.text = "\(oper[operIndex])"
    }
    
    @IBAction func checkButton(_ sender: UIButton) {
   
        switch oper[operIndex] {
        case "+":
            caseresult = randomnumber1 + randomnumber2
        case "-":
            caseresult = randomnumber1 - randomnumber2
        case "*":
            caseresult = randomnumber1 * randomnumber2

        default:
            print("select please")
        }
        

       if (result.text == "" ) {

      
            let alert = UIAlertController(title: "Hello, World", message: "Please enter a Valid input ",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "OK" , style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        
        
            }
       else if (questionscount == mimimumLevel && updatescore == mimimumLevel){
        
        round.text = "level: \(updateround)"
        mimimumLevel += 1
        questionscount = 0
        updatescore = 0
        let alert = UIAlertController(title: "Hello, World", message: "You have completed level \(level)",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK" , style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        level += 1
       }
       
        else if caseresult == Int(result.text!){
            
            updatescore = updatescore + 1
            score.text = "score: \(updatescore)"
//            updateround = updateround + 1
//            round.text = "round: \(updateround)"
            questionscount = questionscount + 1
//            correctquestion = correctquestion + 1
            result.text = ""
            let alert = UIAlertController(title: "Hello, World", message: "Correct! you scored one point",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "OK" , style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
      
        
        else
        {
            questionscount += 1
            updatescore = 0
            updateround = 0
            let alert = UIAlertController(title: "Hello, World", message: "Sorry! Try again! ",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "OK" , style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        viewDidLoad()
        
    }
    @IBAction func Startover(_ sender: UIButton) {
        score.text = "score: \(0)"
        round.text = "round: \(0)"
        result.text = ""
        updatescore = 0
        questionscount = 0
        mimimumLevel = 2
        
    }
    
}



