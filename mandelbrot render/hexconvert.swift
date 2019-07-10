//
//  hexconvert.swift
//  mandelbrot render
//
//  Created by Teddy Gaillard on 2/2/19.
//  Copyright © 2019 thegail. All rights reserved.
//

import Foundation

extension Data {

	init?(fromHexEncodedString string: String, printProgress prints: Bool, progressPercentageIncrements pinc: Int) {
		// Convert 0 ... 9, a ... f, A ...F to their decimal value,
		// return nil for all other input characters
		func decodeNibble(u: UInt16) -> UInt8? {
			switch(u) {
			case 0x30 ... 0x39:
				return UInt8(u - 0x30)
			case 0x41 ... 0x46:
				return UInt8(u - 0x41 + 10)
			case 0x61 ... 0x66:
				return UInt8(u - 0x61 + 10)
			default:
				return nil
			}
		}
		
		self.init(capacity: string.utf16.count/2)
		var even = true
		var byte: UInt8 = 0
		let check = (string.utf16.count/100)*pinc
		var cur = 0
		var percent = 0
		for c in string.utf16 {
			if cur%check == 0 {
				if prints{ print("\(cur/2) of \(string.utf16.count/2) bytes converted. \(percent)% finished with conversion.") }
				percent += pinc
			}
			guard let val = decodeNibble(u: c) else { return nil }
			if even {
				byte = val << 4
			} else {
				byte += val
				self.append(byte)
			}
			even = !even
			cur += 1
		}
		guard even else { return nil }
	}
}

// Usage: Data(fromHexEncodedString: somehexstring)
