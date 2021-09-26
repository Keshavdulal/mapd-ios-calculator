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
    @IBOutlet weak var calculatorInputsOngoing: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    // Stores & displays user inputs (operators & operands)
    var activeInputs:String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        clearAll(); // clear everything by default
    }
    
    // Reset
    func clearAll(){
        activeInputs=""
        calculatorInputsOngoing.text=""
        calculatorResults.text=""
    }
    
    func addActiveInputsToView(value:String){
        activeInputs=activeInputs + value
        calculatorInputsOngoing.text = activeInputs
    }
    
    @IBAction func allClearOnClick(_ sender: Any) {
        clearAll();
    }
    @IBAction func backOnClick(_ sender: Any) {
        addActiveInputsToView(value:"%")
    }
    
    
    @IBAction func addOnClick(_ sender: Any) {
    }
    
    @IBAction func minusOnClick(_ sender: Any) {
        addActiveInputsToView(value:"-")
    }

    @IBAction func multiplyOnClick(_ sender: Any) {
        addActiveInputsToView(value:"*")
    }
    
    @IBAction func divideOnClick(_ sender: Any) {
        addActiveInputsToView(value:"/")
    }
    
    @IBAction func percentageOnClick(_ sender: Any) {
        addActiveInputsToView(value:"%")
    }
    
    
    @IBAction func plusMinusOnClick(_ sender: Any) {
        addActiveInputsToView(value:"-")
    }
    
    @IBAction func decimalOnClick(_ sender: Any) {
    }
    
    //    Numbers
    
    @IBAction func zeroOnClick(_ sender: Any) {
        addActiveInputsToView(value:"0")
    }
    @IBAction func oneOnClick(_ sender: Any) {
        addActiveInputsToView(value:"1")
    }
    @IBAction func twoOnClick(_ sender: Any) {
        addActiveInputsToView(value:"2")
    }
    @IBAction func threeOnClick(_ sender: Any) {
        addActiveInputsToView(value:"3")
    }
    @IBAction func fourOnClick(_ sender: Any) {
        addActiveInputsToView(value:"4")
    }
    @IBAction func fiveOnClick(_ sender: Any) {
        addActiveInputsToView(value:"5")
    }
    @IBAction func sixOnClick(_ sender: Any) {
        addActiveInputsToView(value:"6")
    }
    @IBAction func sevenOnClick(_ sender: Any) {
        addActiveInputsToView(value:"7")
    }
    @IBAction func eightOnClick(_ sender: Any) {
        addActiveInputsToView(value:"8")
    }
    @IBAction func nineOnClick(_ sender: Any) {
        addActiveInputsToView(value:"9")
    }
    
    // Results
    @IBAction func equalsToOnClick(_ sender: Any) {
//        clearAll()
    }
}
