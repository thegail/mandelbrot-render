//
//  UI.swift
//  mandelbrot render
//
//  Created by Teddy Gaillard on 9/17/19.
//  Copyright © 2019 thegail. All rights reserved.
//

import Foundation

func hflag() {
	let helpmessage = "mandelbrot_renderer help\nUsage: /Users/teddy/Desktop/mandelbrot_renderer [-bifh]\n-b: Build a mandelbrot makefile in interactive mode\n-i: Make an image in interactive mode\n-f filepath: Make an image from a mandelbrot makefile\n-h: Get help, but you should know that 'cause you're already here.\n\nWhat it is:\nAn open source command line tool to render the Mandelbrot Set, as well as its variations. This started as a school project and grew into a small piece of python code, and finally into this Swift program. It includes several helpful features such as:\n-A user-friendly (though incomplete) class for dealing with complex numbers that includes operations and is easily extensible\n-Ability to export to Windows `.bmp` files (for speed) and universally accepted `.png` images (for size)\n-Easily configurable settings to change image size, iterations of the fractal, etc.\n-Progress indicators for rendering and data conversion\n\nWhat the seetings mean:\nX position: exactly what it sounds like. 0 is centered.\nY position:ditto.\nWidth:the image width, in pixels. USE A MULTIPLE OF 4, OR ELSE AND ERROR WILL BE THROWN!.\nHeight:ditto\nZoom:the zoom of the image\nMax iterations:the maximum number of iterations preformed when calculating the escape value of the pixel. Higher numbers=higher 'resolution.' However, setting this too high will make it kinda boring. 50-100 is recomended, but 5,10,and 20 are also cool to see.\nSaveas-optional:the path to write the image or makefile to.\nType:Acceptable options PNG and BMP\nColor:the color scheme of the image. Acceptable options are grayscale and color. Color is extremely slow.\n\n\n    -thegail | github.com/thegail\n\n"
	print(helpmessage)
}

func iflag() {
	print("Building a mandelbrot image in interactive mode")
	print("X position:",terminator:" ")
	var x = readLine(strippingNewline: true)
	var d = true
	while d {
		if x == nil {
			print("Invalid option: please type an Int")
			print("X position:",terminator:" ")
			x = readLine(strippingNewline: true)
		} else if Int(x!) == nil {
			print("Invalid option: please type an Int")
			print("X position:",terminator:" ")
			x = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Y position:",terminator:" ")
	var y = readLine(strippingNewline: true)
	d = true
	while d {
		if y == nil {
			print("Invalid option: please type an Int")
			print("Y position:",terminator:" ")
			y = readLine(strippingNewline: true)
		} else if Int(y!) == nil {
			print("Invalid option: please type an Int")
			print("Y position:",terminator:" ")
			y = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Width:",terminator:" ")
	var width = readLine(strippingNewline: true)
	d = true
	while d {
		if width == nil {
			print("Invalid option: please type an Int")
			print("Width:",terminator:" ")
			width = readLine(strippingNewline: true)
		} else if Int(width!) == nil {
			print("Invalid option: please type an Int")
			print("Width:",terminator:" ")
			width = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Height:",terminator:" ")
	var height = readLine(strippingNewline: true)
	d = true
	while d {
		if height == nil {
			print("Invalid option: please type an Int")
			print("Height:",terminator:" ")
			height = readLine(strippingNewline: true)
		} else if Int(x!) == nil {
			print("Invalid option: please type an Int")
			print("Height:",terminator:" ")
			height = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Zoom:",terminator:" ")
	var zoom = readLine(strippingNewline: true)
	d = true
	while d {
		if zoom == nil {
			print("Invalid option: please type an Int")
			print("Zoom:",terminator:" ")
			zoom = readLine(strippingNewline: true)
		} else if Int(zoom!) == nil {
			print("Invalid option: please type an Int")
			print("Zoom:",terminator:" ")
			zoom = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Max iterations:",terminator:" ")
	var maxiter = readLine(strippingNewline: true)
	while d {
		if maxiter == nil {
			print("Invalid option: please type an Int")
			print("Max iterations:",terminator:" ")
			maxiter = readLine(strippingNewline: true)
		} else if Int(maxiter!) == nil {
			print("Invalid option: please type an Int")
			print("Max iterations:",terminator:" ")
			maxiter = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Saveas-optional:",terminator:" ")
	var filepath = readLine(strippingNewline: true)
	if filepath == nil || filepath == "" {
		filepath = "mandel.png"
	}
	print("Type:",terminator:" ")
	var type = readLine(strippingNewline: true)
	var bt = false
	d = true
	while d {
		if type == "BMP" {
			bt = true
			d = false
		} else if type == "PNG" {
			bt = false
			d = false
		} else {
			print("Invalid option")
			print("Type:",terminator:" ")
			type = readLine(strippingNewline: true)
		}
	}
	print("Colorscheme:",terminator:" ")
	var colorscheme = readLine(strippingNewline: true)
	d = true
	var color = colorScheme.grayscale
	while d {
		if colorscheme == "grayscale" {
			color = .grayscale
			d = false
		} else if colorscheme == "color" {
			color = .hsb
			d = false
		} else {
			print("Invalid option")
			print("Colorscheme:",terminator:" ")
			colorscheme = readLine(strippingNewline: true)
		}
	}
	if bt {
		makeBitmap(MinimumX: Int(x!)!-Int(width!)!/2, MaximumX: Int(x!)!+Int(width!)!/2, MinumumY: Int(x!)!-Int(width!)!/2, MaximumY: Int(y!)!+Int(width!)!/2, ZoomValue: Double(zoom!)!, MaxIterationsDone: Int(maxiter!)!, pathToWriteFile: String(FileManager.default.currentDirectoryPath), printProgress: true, colorScheme: color, progressPercentegeIncrements: 5, iterationOfRender: 1)
	} else {
		makePNG(MinimumX: Int(x!)!-Int(width!)!/2, MaximumX: Int(x!)!+Int(width!)!/2, MinumumY: Int(x!)!-Int(width!)!/2, MaximumY: Int(y!)!+Int(width!)!/2, ZoomValue: Double(zoom!)!, MaxIterationsDone: Int(maxiter!)!, pathToWriteFile: filepath!, printProgress: true, colorScheme: color, progressPercentegeIncrements: 5, iterationOfRender: 1)
	}
}

func bflag() {
	print("Building a mandelbrot makefile in interactive mode")
	print("X position:",terminator:" ")
	var x = readLine(strippingNewline: true)
	var d = true
	while d {
		if x == nil {
			print("Invalid option: please type an Int")
			print("X position:",terminator:" ")
			x = readLine(strippingNewline: true)
		} else if Int(x!) == nil {
			print("Invalid option: please type an Int")
			print("X position:",terminator:" ")
			x = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Y position:",terminator:" ")
	var y = readLine(strippingNewline: true)
	d = true
	while d {
		if y == nil {
			print("Invalid option: please type an Int")
			print("Y position:",terminator:" ")
			y = readLine(strippingNewline: true)
		} else if Int(y!) == nil {
			print("Invalid option: please type an Int")
			print("Y position:",terminator:" ")
			y = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Width:",terminator:" ")
	var width = readLine(strippingNewline: true)
	d = true
	while d {
		if width == nil {
			print("Invalid option: please type an Int")
			print("Width:",terminator:" ")
			width = readLine(strippingNewline: true)
		} else if Int(width!) == nil {
			print("Invalid option: please type an Int")
			print("Width:",terminator:" ")
			width = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Height:",terminator:" ")
	var height = readLine(strippingNewline: true)
	d = true
	while d {
		if height == nil {
			print("Invalid option: please type an Int")
			print("Height:",terminator:" ")
			height = readLine(strippingNewline: true)
		} else if Int(x!) == nil {
			print("Invalid option: please type an Int")
			print("Height:",terminator:" ")
			height = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Zoom:",terminator:" ")
	var zoom = readLine(strippingNewline: true)
	d = true
	while d {
		if zoom == nil {
			print("Invalid option: please type an Int")
			print("Zoom:",terminator:" ")
			zoom = readLine(strippingNewline: true)
		} else if Int(zoom!) == nil {
			print("Invalid option: please type an Int")
			print("Zoom:",terminator:" ")
			zoom = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Max iterations:",terminator:" ")
	var maxiter = readLine(strippingNewline: true)
	while d {
		if maxiter == nil {
			print("Invalid option: please type an Int")
			print("Max iterations:",terminator:" ")
			maxiter = readLine(strippingNewline: true)
		} else if Int(maxiter!) == nil {
			print("Invalid option: please type an Int")
			print("Max iterations:",terminator:" ")
			maxiter = readLine(strippingNewline: true)
		} else {
			d = false
		}
	}
	print("Saveas-optional:",terminator:" ")
	var filepath = readLine(strippingNewline: true)
	if filepath == nil || filepath == "" {
		filepath = "untitled.mandel"
	}
	print("Type:",terminator:" ")
	var type = readLine(strippingNewline: true)
	d = true
	while d {
		if type == "BMP" {
			d = false
		} else if type == "PNG" {
			d = false
		} else {
			print("Invalid option")
			print("Type:",terminator:" ")
			type = readLine(strippingNewline: true)
		}
	}
	print("Colorscheme:",terminator:" ")
	var colorscheme = readLine(strippingNewline: true)
	d = true
	while d {
		if colorscheme == "grayscale" {
			d = false
		} else if colorscheme == "color" {
			d = false
		} else {
			print("Invalid option")
			print("Colorscheme:",terminator:" ")
			colorscheme = readLine(strippingNewline: true)
		}
	}
	let finalfile = "\(x!)\n\(y!)\n\(width!)\n\(height!)\n\(zoom!)\n\(maxiter!)\n\(filepath!)\n\(type!)\n\(colorscheme!)"
	writeFile(filePath: filepath!, fileContents: Data(finalfile.utf8), printProgress: true)
}

func fflag(name:String) {
	let contents: String
	print("Making mandelbrot image from buildfile \(name)")
	do {
		contents = try String(contentsOf: URL(fileURLWithPath: fullPath(path: name)))
	} catch let error{
		print(error)
		exit(2)
	}
	let atributearray = contents.components(separatedBy: "\n")
	if Int(atributearray[0]) == nil {
		print("File corrupted or of invalid format")
		exit(10)
	}
	if Int(atributearray[1]) == nil {
		print("File corrupted or of invalid format")
		exit(10)
	}
	if Int(atributearray[2]) == nil {
		print("File corrupted or of invalid format")
		exit(10)
	}
	if Int(atributearray[3]) == nil {
		print("File corrupted or of invalid format")
		exit(10)
	}
	if Int(atributearray[4]) == nil {
		print("File corrupted or of invalid format")
		exit(10)
	}
	if Int(atributearray[5]) == nil {
		print("File corrupted or of invalid format")
		exit(10)
	}
	var filepath:String
	if atributearray[6] == "" {
		filepath = "madnel.png"
	} else {
		filepath = atributearray[6]+".png"
	}
	var isitabitmap = false
	if atributearray[7] == "BMP" {
		isitabitmap = true
	} else if atributearray[7] != "PNG" {
		print("File corrupted or of invalid format")
		exit(10)
	}
	var color = colorScheme.grayscale
	if atributearray[8] == "color" {
		color = .hsb
	} else if atributearray[8] != "grayscale" {
		print("File corrupted or of invalid format")
		exit(10)
	}
	if isitabitmap {
		makeBitmap(MinimumX: Int(atributearray[0])!-Int(atributearray[2])!/2, MaximumX: Int(atributearray[0])!+Int(atributearray[2])!/2, MinumumY: Int(atributearray[1])!-Int(atributearray[3])!/2, MaximumY: Int(atributearray[1])!+Int(atributearray[3])!/2, ZoomValue: Double(atributearray[4])!, MaxIterationsDone: Int(atributearray[5])!, pathToWriteFile: filepath, printProgress: true, colorScheme: color, progressPercentegeIncrements: 5, iterationOfRender: 1)
	} else {
		makePNG(MinimumX: Int(atributearray[0])!-Int(atributearray[2])!/2, MaximumX: Int(atributearray[0])!+Int(atributearray[2])!/2, MinumumY: Int(atributearray[1])!-Int(atributearray[3])!/2, MaximumY: Int(atributearray[1])!+Int(atributearray[3])!/2, ZoomValue: Double(atributearray[4])!, MaxIterationsDone: Int(atributearray[5])!, pathToWriteFile: filepath, printProgress: true, colorScheme: color, progressPercentegeIncrements: 5, iterationOfRender: 1)
	}
}

func processFlags() {
	
	var flag = true
	
	if CommandLine.arguments.count == 1 {
		iflag()
	}
	
	for i in CommandLine.arguments.dropFirst() {
		if flag {
			if Array(i)[0] == "-" {
				switch i.dropFirst() {
				case "h":
					hflag()
				case "b":
					bflag()
				case "i":
					iflag()
				case "f":
					flag = false
				default:
					print("Use the -h flag for help.")
				}
			} else {
				print("Use the -h flag for help.")
			}
		} else {
			flag = true
			fflag(name: i)
		}
	}
}
