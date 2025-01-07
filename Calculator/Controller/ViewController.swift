//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - IBOutlets
	
	@IBOutlet weak var displayLabel: UILabel!
	
	// MARK: - Variables/Constants
	
	private var calculator = CalculatorLogic()
	private var isFinishedTypingNumber = true
	private var displayValue: Double {
		get {
			guard let currentDisplayValue = Double(displayLabel.text!) else {
				fatalError("Cannot convert display label text to a Dobule!")
			}
			return currentDisplayValue
		}
		set {
			displayLabel.text = String(newValue)
		}
	}
	
	// MARK: - IBActions
	
	@IBAction func calcButtonPressed(_ sender: UIButton) {
		isFinishedTypingNumber = true
		calculator.setNumber(displayValue)
		
		if let calcMethod = sender.currentTitle {
			guard let result = calculator.calculate(symbol: calcMethod) else {
				fatalError("The result of the calculation is nil")
			}
			displayValue = result
		}
	}
	
	
	@IBAction func numButtonPressed(_ sender: UIButton) {
		if let numValue = sender.currentTitle {
			if isFinishedTypingNumber {
				displayLabel.text = numValue
				isFinishedTypingNumber = false
				
			} else {
				if numValue == "." {
					let isInt = floor(displayValue) == displayValue
					if !isInt {
						return
					}
				}
				
				displayLabel.text?.append(numValue)
			}
		}
	}
	
}

