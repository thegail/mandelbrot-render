//
//  root.swift
//  mandelbrot render
//
//  Created by Teddy Gaillard on 2/2/19.
//  Copyright © 2019 thegail. All rights reserved.
//

import Foundation

struct complex: CustomStringConvertible {
	var real:Double
	var imag:Double
	
	var description: String {
		return "\(real)+\(imag)i"
	}

	func abs() -> Double { return (self.real*self.real+self.imag*self.imag).squareRoot() }
	
	func exp(_ p:Int) -> complex {
		if p==1 {
			return self
		} else {
			return self * self.exp(p-1)
		}
	}
	
	init(real:Double,imag:Double) {
		self.real = real
		self.imag = imag
	}
}

extension complex {
	static func + (left:complex, right:complex) -> complex {
		let newr = left.real+right.real
		let newi = left.imag+right.imag
		return complex(real:newr,imag:newi)
	}
	static func - (left:complex, right:complex) -> complex {
		let newr = left.real-right.real
		let newi = left.imag-right.imag
		return complex(real:newr,imag:newi)
	}
	static func * (left:complex, right:complex) -> complex {
		let nr = (left.real*right.real)+(left.imag*right.imag * -1)
		let ni = (left.real*right.imag)+(left.imag*right.real)
		return complex(real: nr, imag: ni)
	}
}

func mandelbrot(RealComponent x:Double,ImaginaryComponent y:Double,MaxIterations i:Int, MultibrotStage stage:Int) -> Int {
	let c = complex(real: x,imag: y)
	var z = c
	var pasti = 0
	for n in 0...i {
		if z.abs() > 2 {
			return n
		}
		z = z.exp(stage+1)+c
		pasti = n
	}
	return pasti
}
