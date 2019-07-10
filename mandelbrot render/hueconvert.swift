//
//  hueconvert.swift
//  mandelbrot render
//
//  Created by Teddy Gaillard on 2/3/19.
//  Copyright © 2019 thegail. All rights reserved.
//

import Foundation

func makeArray() -> Array<Array<Int>>{
	var final:Array<Array<Int>> = []
	for i in 0...255 {
		final.append([255,i,0])
	}
	for i in (0...255).reversed() {
		final.append([i,255,0])
	}
	for i in 0...255 {
		final.append([0,255,i])
	}
	for i in (0...255).reversed() {
		final.append([0,i,255])
	}
	for i in 0...255 {
		final.append([i,0,255])
	}
	for i in (0...255).reversed() {
		final.append([255,0,i])
	}
	return final
}

let arraymake = makeArray()

func hsvToRgb(hsvValueToConvert val:Int) -> Array<Int> {
	return arraymake[val%360]
}
