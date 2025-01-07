//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Isaac Urbina on 1/7/25.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
	
	var number: Double?
	
	mutating func setNumber(_ number: Double) {
		self.number = number
	}
	
	func calculate(symbol: String) -> Double? {
		guard let number else {
			fatalError("number is nil")
		}
		switch symbol {
		case "+/-" : return number * -1
		case "AC" : return 0
		case "%" : return number * 0.01
		case "+" : return 0
		case "=" : return 0
		default:
			print("not implemented yet")
			return nil
		}
	}
}

