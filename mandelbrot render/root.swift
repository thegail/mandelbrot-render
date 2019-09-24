//
//  root.swift
//  mandelbrot render
//
//  Created by Teddy Gaillard on 2/2/19.
//  Copyright © 2019 thegail. All rights reserved.
//

import Foundation
import complex

func mandelbrot(RealComponent x:Double,ImaginaryComponent y:Double,MaxIterations i:Int, MultibrotStage stage:Int) -> Int {
	let c = Complex(real: x,imag: y)
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
