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

class ViewController: UIViewController {
    //    IBOutlets for labels
    @IBOutlet weak var inputDisplayLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    // Stores & displays user inputs (operators & operands)
    var userInput:String = ""
    var firstOperand:String = ""
    var secondOperand:String = ""
    var userSelectedOperation:String=""
    
    var validOperatorEntered = false
    var resultsDeclared = false
//    var continuousOperationMode = false
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll(); // clear everything by default
    }
    
    // Reset application
    func clearAll(){
        inputDisplayLabel.text=""
        resultsLabel.text="0"
        
//        continuousOperationMode = false
    }
    
    func renderInputInView(value:String){
        userInput = String(value)
        inputDisplayLabel.text = inputDisplayLabel.text! + userInput
        
        if validOperatorEntered{
            secondOperand = secondOperand + userInput
        }
    }

    // Operands Click Handlers
    @IBAction func plusMinusOnClick(_ sender: Any) {
        renderInputInView(value:"-")
    }
    @IBAction func decimalOnClick(_ sender: Any) {
        renderInputInView(value:".")
    }
    @IBAction func zeroOnClick(_ sender: Any) {
        renderInputInView(value:"0")
    }
    @IBAction func oneOnClick(_ sender: Any) {
        renderInputInView(value:"1")
    }
    @IBAction func twoOnClick(_ sender: Any) {
        renderInputInView(value:"2")
    }
    @IBAction func threeOnClick(_ sender: Any) {
        renderInputInView(value:"3")
    }
    @IBAction func fourOnClick(_ sender: Any) {
        renderInputInView(value:"4")
    }
    @IBAction func fiveOnClick(_ sender: Any) {
        renderInputInView(value:"5")
    }
    @IBAction func sixOnClick(_ sender: Any) {
        renderInputInView(value:"6")
    }
    @IBAction func sevenOnClick(_ sender: Any) {
        renderInputInView(value:"7")
    }
    @IBAction func eightOnClick(_ sender: Any) {
        renderInputInView(value:"8")
    }
    @IBAction func nineOnClick(_ sender: Any) {
        renderInputInView(value:"9")
    }
    
    @IBAction func backOnClick(_ sender: Any) {
        var temp:String = inputDisplayLabel.text!
        temp = String(temp.dropLast())
//        renderInputInView(value:temp)
        inputDisplayLabel.text = temp
    }
    
    // Operators Click Handlers
    @IBAction func addOnClick(_ sender: Any) {
        operatorsHandler(value:"+")
    }
    
    @IBAction func minusOnClick(_ sender: Any) {
        operatorsHandler(value:"-")
    }

    @IBAction func multiplyOnClick(_ sender: Any) {
        operatorsHandler(value:"*")
    }
    
    @IBAction func divideOnClick(_ sender: Any) {
        operatorsHandler(value:"/")
    }
    
    @IBAction func percentageOnClick(_ sender: Any) {
    }
    
    func operatorsHandler (value:String){
        firstOperand=inputDisplayLabel.text!
        userSelectedOperation=value
        validOperatorEntered=true
        renderInputInView(value:value)
        
//         Enter Continouse Operation Mode
//        if resultsDeclared{
//            continuousOperationMode = true
//        }
    }
    
    // Results
    @IBAction func equalsToOnClick(_ sender: Any) {
        var Results:Double?
        let firstOperandDouble = Double(firstOperand)
        let secondOperandDouble = Double(secondOperand)
        
        switch userSelectedOperation {
        case "+":
            Results=firstOperandDouble! + secondOperandDouble!
        case "-":
            Results=firstOperandDouble! - secondOperandDouble!
        case "*":
            Results=firstOperandDouble! * secondOperandDouble!
        case "/":
            Results=firstOperandDouble! / secondOperandDouble!
//        case "%":
//            Results=firstOperand! % secondOperand!
        default:
            Results=0
        }
        
        // Result is declared
        resultsDeclared = true
        // No operation is in active mode now
        validOperatorEntered = false
        
        // Display results in view
        resultsLabel.text = String(Results!)
        
        // Reset operation
        userSelectedOperation=""
        // Reset second operand
        secondOperand = ""
        // Pass Results to first operand to continue further operations
        firstOperand = String(Results!)
    }
    
    @IBAction func allClearOnClick(_ sender: Any) {
        clearAll();
    }
}
