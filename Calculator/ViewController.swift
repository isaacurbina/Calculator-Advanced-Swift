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
		
		if let calcMethod = sender.currentTitle {
			switch calcMethod {
			case "+/-" : displayValue *= -1
			case "AC" : displayValue = 0
			case "%" : displayValue *= 0.01
			default:
				print("not implemented yet")
			}
		}
	}
	
	
	@IBAction func numButtonPressed(_ sender: UIButton) {
		//What should happen when a number is entered into the keypad
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

