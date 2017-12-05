//
//  ViewController.swift
//  PrimeNumber
//
//  Created by 杨以皓 on 12/2/17.
//  Copyright © 2017 yyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBAction func doThePrimeTest(_ sender: UIButton) {
        if let inputText = inputTextField.text, let inputNumber = Int(inputText) {
                checkPrime(withNumber: inputNumber){
                    self.resultLabel.text = $0
                    self.resultLabel.isHidden = false
                    }
        }
        inputTextField.text = ""
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkPrime(withNumber testNumber:Int) -> String{
        var isPrime:Bool? = true
        if testNumber <= 0{
            isPrime = nil
        } else if testNumber == 1{
            isPrime = true
        } else {
            for i in 2..<testNumber {
                if (testNumber % i == 0){
                    isPrime = false
                    break
                }
            }
        }
        
        if isPrime == true{
            return "\(testNumber) is prime"
        } else if isPrime == false{
            return "\(testNumber) is not prime"
        } else {
            return "Please return a number greater than 0"
        }
    }

    func checkPrime(withNumber number:Int, andCompletionHandler handler:(String) -> ()){
        handler(checkPrime(withNumber: number))
    }
}

