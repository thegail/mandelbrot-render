//
//  bitmapcodegen.swift
//  mandelbrot render
//
//  Created by Teddy Gaillard on 2/2/19.
//  Copyright © 2019 thegail. All rights reserved.
//

import Foundation

enum colorScheme {
	case grayscale
	case hsb
}

//No internet :( . I don't know how to find the length of a string.
func teddylen(_ str:String) -> Int {
	var finallen = 0
	for _ in str {
		finallen += 1
	}
	return finallen
}

func flipper(stringToBeFlipped str:String) -> String{
	var newstr = str
	while teddylen(newstr)<4 {
		newstr = "0"+newstr
	}
	return String(newstr.suffix(2)+newstr.prefix(2))
}

func checkWidthHeight(widthToCheck w:Int, heightToCheck h:Int) -> Bool {
	if w%4==0 && h%4==0 {
		return true
	} else {
		print("Width and height are not a multiple of four. Are you sure you would like to continue? Y/n")
		let response = readLine()
		switch response {
		case "Y":return true
		case "n":return false
		default:
			print("Invalid response")
			return checkWidthHeight(widthToCheck: w, heightToCheck: h)
		}
	}
}

func makeBitmapCode(MinimumX minx:Int, MaximumX maxx:Int, MinumumY miny:Int, MaximumY maxy:Int, ZoomValue zoom:Double, MaxIterationsDone maxiter:Int, printProgress prints:Bool, colorScheme colsch:colorScheme, progressPercentegeIncrements pinc:Int, RenderStage renderstage: Int) -> String{
	if prints{print("Starting render...")}
	if prints{print("Starting header...")}
	var full = ["424D4C000000000000001A0000000C000000"]
	let width = maxx-minx
	let height = maxy-miny
	let widthx = flipper(stringToBeFlipped: String(width, radix:16))
	let heightx = flipper(stringToBeFlipped: String(height, radix:16))
	if checkWidthHeight(widthToCheck: width, heightToCheck: height) {
		()
	} else {
		print("err:user_exit")
	}
	var hexcolorr = "0"
	var hexcolorg = "0"
	var hexcolorb = "0"
	var iters = 0
	var color = 0
	var colorr = 0
	var colorg = 0
	var colorb = 0
	var hexcolor = "0"
	let checkpoint = (width*height)/(100/pinc)
	var curpix = 1
	var percent = pinc
	full.append(widthx)
	full.append(heightx)
	full.append("01001800")
	if prints{print("Header finished")}
	if prints{print("Starting body...")}
	for x in minx...maxx-1 {
		for y in miny...maxy-1 {
			curpix += 1
			if curpix%checkpoint == 0 && prints{
				print("\(curpix) pixels of \(width*height) pixels finished, \(percent)% finished with render.")
				percent += pinc
			}
			iters = mandelbrot(RealComponent: Double(x)/zoom, ImaginaryComponent: Double(y)/zoom, MaxIterations: maxiter,MultibrotStage: renderstage)
			if colsch == .grayscale {
				color = Int(255.0*(Double(iters)/Double(maxiter)))
			} else {
				colorr = hsvToRgb(hsvValueToConvert: Int(1535.0*(Double(iters)/Double(maxiter))))[0]
				colorg = hsvToRgb(hsvValueToConvert: Int(1535.0*(Double(iters)/Double(maxiter))))[1]
				colorb = hsvToRgb(hsvValueToConvert: Int(1535.0*(Double(iters)/Double(maxiter))))[2]
			}
			hexcolor = String(color,radix: 16)
			if colsch == .grayscale {
				if color < 16 {
					full.append("0\(hexcolor)")
					full.append("0\(hexcolor)")
					full.append("0\(hexcolor)")
				} else {
					full.append(hexcolor)
					full.append(hexcolor)
					full.append(hexcolor)
				}
			} else {
				hexcolorr = String(colorr,radix: 16)
				hexcolorg = String(colorg,radix: 16)
				hexcolorb = String(colorb,radix: 16)
				if colorr < 16 {
					full.append("0\(hexcolorr)")
				} else {
					full.append(hexcolorr)
				}
				if colorg < 16 {
					full.append("0\(hexcolorg)")
				} else {
					full.append(hexcolorg)
				}
				if colorb < 16 {
					full.append("0\(hexcolorb)")
				} else {
					full.append(hexcolorb)
				}
			}
		}
	}
	full.append("0000")
	if prints{print("Finished body...")}
	if prints{print("Finished render...")}
	let hexString = full.joined(separator: "")
	return hexString
}
