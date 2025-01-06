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
	
	// MARK: - IBActions
	
	@IBAction func calcButtonPressed(_ sender: UIButton) {
		isFinishedTypingNumber = true
		guard let number = Double(displayLabel.text!) else {
			fatalError("Cannot convert display label text to a Double.")
		}
		
		if let calcMethod = sender.currentTitle {
			switch calcMethod {
			case "+/-" : displayLabel.text = String(number * -1)
			case "AC" : displayLabel.text = "0"
			case "%" : displayLabel.text = String(number / 100)
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
				displayLabel.text?.append(numValue)
			}
		}
	}
	
}

