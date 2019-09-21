//
//  finalgen.swift
//  mandelbrot render
//
//  Created by Teddy Gaillard on 9/20/19.
//  Copyright © 2019 thegail. All rights reserved.
//

import Foundation
import Cocoa

func makeBitmap(MinimumX minx:Int, MaximumX maxx:Int, MinumumY miny:Int, MaximumY maxy:Int, ZoomValue zoom:Double, MaxIterationsDone maxiter:Int, pathToWriteFile fpath:String, printProgress prints:Bool, colorScheme colsch:colorScheme, progressPercentegeIncrements pinc:Int, iterationOfRender render:Int){
	if prints {print("Starting make...")}
	let hexcode = makeBitmapCode(MinimumX: minx, MaximumX: maxx, MinumumY: miny, MaximumY: maxy, ZoomValue: zoom, MaxIterationsDone: maxiter, printProgress: prints, colorScheme: colsch, progressPercentegeIncrements: pinc, RenderStage: render)
	if prints{print("Converting...")}
	let datafromhex = Data(fromHexEncodedString: hexcode, printProgress:prints, progressPercentageIncrements:pinc)
	if prints{print("Writing...")}
	writeFile(filePath: fpath, fileContents: datafromhex!, printProgress: prints)
	if prints {print("Finished make")}
	if prints {print("End")}
}

func makePNG(MinimumX minx:Int, MaximumX maxx:Int, MinumumY miny:Int, MaximumY maxy:Int, ZoomValue zoom:Double, MaxIterationsDone maxiter:Int, pathToWriteFile fpath:String, printProgress prints:Bool, colorScheme colsch:colorScheme, progressPercentegeIncrements pinc:Int, iterationOfRender render:Int){
	if prints {print("Starting make...")}
	let hexcode = makeBitmapCode(MinimumX: minx, MaximumX: maxx, MinumumY: miny, MaximumY: maxy, ZoomValue: zoom, MaxIterationsDone: maxiter, printProgress: prints, colorScheme: colsch, progressPercentegeIncrements: pinc, RenderStage: render)
	if prints{print("Converting...")}
	let datafromhex = Data(fromHexEncodedString: hexcode, printProgress:prints, progressPercentageIncrements:pinc)
	if prints{print("Making PNG")}
	let swiftimagedata = NSBitmapImageRep(data: datafromhex!)
	let pngimagedata = swiftimagedata?.representation(using: .png, properties: [:])
	if prints{print("Writing...")}
	writeFile(filePath: fpath, fileContents: pngimagedata!, printProgress: prints)
	if prints {print("Finished make")}
	if prints {print("End")}
}
