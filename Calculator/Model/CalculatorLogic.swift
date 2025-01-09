//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Isaac Urbina on 1/7/25.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
	
	private var number: Double?
	
	private var intermediateCalculation: (n1: Double, calcMethod: String)?
	
	mutating func setNumber(_ number: Double) {
		self.number = number
	}
	
	mutating func calculate(symbol: String) -> Double? {
		guard let number else {
			fatalError("number is nil")
		}
		switch symbol {
		case "+/-" :
			return number * -1
		case "AC" :
			return 0
		case "%" :
			return number * 0.01
		case "=" :
			return performTwoNumCalculation(n2: number)
		default:
			intermediateCalculation = (n1: number, calcMethod: symbol)
		}
		return nil
	}
	
	private func performTwoNumCalculation(n2: Double) -> Double? {
		guard let intermediateCalculation else {
			fatalError("intermediateCalculation is nil")
		}
		let (n1, calcMethod) = intermediateCalculation
		switch calcMethod {
		case "+" :
			return n1 + n2
		case "-" :
			return n1 - n2
		case "×" :
			return n1 * n2
		case "÷" :
			return n1 / n2
		default:
			fatalError("The operation \(calcMethod) passed in does not match any of the cases.")
		}
		return nil
	}
}

