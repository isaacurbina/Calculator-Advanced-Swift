//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Isaac Urbina on 1/7/25.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
	
	var number: Double
	
	init(number: Double) {
		self.number = number
	}
	
	func calculate(symbol: String) -> Double? {
		switch symbol {
		case "+/-" : return number * -1
		case "AC" : return 0 
		case "%" : return number * 0.01
		default:
			print("not implemented yet")
			return nil
		}
	}
}

