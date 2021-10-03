/**
 * ViewController.swift
 * Author        : Keshav Dulal
 * StudentID   : 301209947
 * Date           : 26/09/2021
 *
 * Author        : Aishwarya Shrestha
 * StudentID   : 301138662
 * Date            : 26/09/2021
 *
 * App Description:
 * A simple Calculator application
 *
 * Version:
 * 1
 */

import UIKit

// Default ViewController for our Calculator UI
class ViewController: UIViewController {
    //    IBOutlets for labels
    @IBOutlet weak var inputDisplayLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    // Stores & displays user inputs (operators & operands)
    var userInput:String = ""
    var firstOperand:String = ""
    var secondOperand:String = ""
    var userSelectedOperation:String=""
    
    var isOperationSelected = false
    var isResultCalculated = false
    var isContinuousMode = false
    var isPlusMinusToggled = false
    
     
    // Built-in function to run tasks when view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll(); // clear everything by default
    }

    // Operands Click Handlers
    @IBAction func plusMinusOnClick(_ sender: Any) {
        if isPlusMinusToggled {
            inputDisplayLabel.text = "+"
        }else{
            inputDisplayLabel.text = "-"
        }
        
        isPlusMinusToggled = !isPlusMinusToggled
    }
    
    // handle decimal button on click
    @IBAction func decimalOnClick(_ sender: Any) {
        renderInputInView(value:".")
    }
    
    // handle zero button on click
    @IBAction func zeroOnClick(_ sender: Any) {
        renderInputInView(value:"0")
    }
    
    // handle button one on click
    @IBAction func oneOnClick(_ sender: Any) {
        renderInputInView(value:"1")
    }
    
    // handle button two on click
    @IBAction func twoOnClick(_ sender: Any) {
        renderInputInView(value:"2")
    }
    
    // handle button three on click
    @IBAction func threeOnClick(_ sender: Any) {
        renderInputInView(value:"3")
    }
    
    // handle button four on click
    @IBAction func fourOnClick(_ sender: Any) {
        renderInputInView(value:"4")
    }
    
    // handle button five on click
    @IBAction func fiveOnClick(_ sender: Any) {
        renderInputInView(value:"5")
    }
    
    // handle button six on click
    @IBAction func sixOnClick(_ sender: Any) {
        renderInputInView(value:"6")
    }
    
    // handle button seven on click
    @IBAction func sevenOnClick(_ sender: Any) {
        renderInputInView(value:"7")
    }
    
    // handle button eight on click
    @IBAction func eightOnClick(_ sender: Any) {
        renderInputInView(value:"8")
    }
    
    // handle button nine on click
    @IBAction func nineOnClick(_ sender: Any) {
        renderInputInView(value:"9")
    }
    
    // handle back button on click
    @IBAction func backOnClick(_ sender: Any) {
        var temp:String = inputDisplayLabel.text!
        temp = String(temp.dropLast())
        inputDisplayLabel.text = temp
    }
    
    // ------------ Operation Buttons Handler ------------
    
    // handle addition button on click
    @IBAction func addOnClick(_ sender: Any) {
        operatorsHandler(value:"+")
    }
    
    // handle minus button on click
    @IBAction func minusOnClick(_ sender: Any) {
        operatorsHandler(value:"-")
    }

    // handle multiply button on click
    @IBAction func multiplyOnClick(_ sender: Any) {
        operatorsHandler(value:"*")
    }
    
    // handle divide button on click
    @IBAction func divideOnClick(_ sender: Any) {
        operatorsHandler(value:"/")
    }
    
    // handle percentage button on click
    @IBAction func percentageOnClick(_ sender: Any) {
        // Programmatically simulate divide by 100
        operatorsHandler(value: "/")
        renderInputInView(value:"100")
        secondOperand = "100"
        
        calculateResults();
    }
    
    // handle equals-to button on click
    @IBAction func equalsToOnClick(_ sender: Any) {
      calculateResults()
    }
    
    // handle All-clear button on click
    @IBAction func allClearOnClick(_ sender: Any) {
        clearAll();
    }
    
    // ---------- Custom Functions ---------
    
    // Input Renderer
    func renderInputInView(value:String){
        userInput = String(value)
        inputDisplayLabel.text = inputDisplayLabel.text! + userInput
        
        // If user selects (or presses) a valid operation
        // then subsequent inputs are stored as secondOperand
        if isOperationSelected {
            secondOperand = secondOperand + userInput
        }
    }
    
    // Handle Operators on click
    func operatorsHandler (value:String){
    // Enter Continouse Operation Mode
        if isResultCalculated{
            isContinuousMode = true
            // extract previous result & save it as first operand
            firstOperand = resultsLabel.text!
        }else{
            firstOperand=inputDisplayLabel.text!
        }
        
        userSelectedOperation=value
        renderInputInView(value:value)
        isOperationSelected=true
    }
    
    // Calcuate Final Results
    func calculateResults(){
        var Results:Double?
        let firstOperandDouble = Double(firstOperand)
        let secondOperandDouble = Double(secondOperand)
        
        print("->", firstOperand, secondOperand)
        print("-->", firstOperandDouble, userSelectedOperation, secondOperandDouble)
        
        switch userSelectedOperation {
        case "+":
            Results=firstOperandDouble! + secondOperandDouble!
        case "-":
            Results=firstOperandDouble! - secondOperandDouble!
        case "*":
            Results=firstOperandDouble! * secondOperandDouble!
        case "/":
            Results=firstOperandDouble! / secondOperandDouble!
        default:
            Results=0
        }
        
        // Result is declared
        isResultCalculated = true
        // No operation is in active mode now
        isOperationSelected = false
        
        // Display results in view
        resultsLabel.text = String(Results!)
        
        // Reset operation & operands
        firstOperand = ""
        secondOperand = ""
        userSelectedOperation = ""
    }
    
    // Reset the application state
    func clearAll(){
        inputDisplayLabel.text=""
        resultsLabel.text="0"
        
        isResultCalculated = false
        isContinuousMode = false
        isOperationSelected = false
        isPlusMinusToggled = false
    }
}
