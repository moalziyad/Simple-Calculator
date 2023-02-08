/*
 ViewController.swift
 Created by Mohammed AlZiyad
*/

import UIKit
import Foundation

class ViewController: UIViewController
{

    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings:String = ""
    // function that calculating binary
    /*
    func BinaryAdd(binaryOne: String, binaryTwo: String) {
        //for bin in binary]

        var binaryOne = Array(binaryOne)
        var binaryTwo = Array(binaryTwo)
        
        var i: Int = binaryOne.count
        var j: Int = binaryTwo.count
        
        for index in stride(from: i, to: 0, by: -1) {
            if i[index] == j[index] {
                
            }
        }
        
        print(binaryOne)
        print(i, j)
        
        
    }*/
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
    {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    

    @IBAction func equalsTap(_ sender: Any)
    {
        if(validInput())
        {
            // BinaryAdd(binaryOne: "1011", binaryTwo: "0110")
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let checkedWorkingsForMultiplication = checkedWorkingsForPercent.replacingOccurrences(of: "x", with: "*")
            let checkedWorkingsForDivision = checkedWorkingsForMultiplication.replacingOccurrences(of: "÷", with: "/")
            let checkedWorkingsForSquare = checkedWorkingsForDivision.replacingOccurrences(of: "^", with: "**")
            let checkedWorkingsForSquareRoot = checkedWorkingsForSquare.replacingOccurrences(of: "√(", with: "sqrt(")
            let expression = NSExpression(format: checkedWorkingsForSquareRoot)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else
        {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        print(funcCharIndexes)
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == workings.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func allClearTap(_ sender: Any)
    {
        clearAll()
    }
    
    @IBAction func backTap(_ sender: Any)
    {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    // Add number into label
    func addToWorkings(value: String)
    {
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    @IBAction func percentTap(_ sender: Any)
    {
        addToWorkings(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any)
    {
        addToWorkings(value: "÷")
    }
    
    @IBAction func SquareTap(_ sender: Any)
    {
        addToWorkings(value: "^")
    }
    
    @IBAction func SquareRootTap(_ sender: Any)
    {
        addToWorkings(value: "√(")
    }
    
    @IBAction func timesTap(_ sender: Any)
    {
        addToWorkings(value: "x")
    }
    
    @IBAction func minusTap(_ sender: Any)
    {
        addToWorkings(value: "-")
    }
    
    @IBAction func plusTap(_ sender: Any)
    {
        addToWorkings(value: "+")
    }
    
    @IBAction func decimalTap(_ sender: Any)
    {
        addToWorkings(value: ".")
    }
    
    @IBAction func zeroTap(_ sender: Any)
    {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneTap(_ sender: Any)
    {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any)
    {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any)
    {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any)
    {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any)
    {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any)
    {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any)
    {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any)
    {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any)
    {
        addToWorkings(value: "9")
    }
    
    @IBAction func LeftBrackeyTap(_ sender: Any)
    {
        addToWorkings(value: "(")
    }
    
    @IBAction func RightBrackeyTap(_ sender: Any)
    {
        addToWorkings(value: ")")
    }
    
}



