//
//  filewrite.swift
//  mandelbrot render
//
//  Created by Teddy Gaillard on 2/2/19.
//  Copyright © 2019 thegail. All rights reserved.
//

import Foundation

func fullPath(path: String) -> String {
	if Array(path)[0] == "/" {
		return path
	} else {
		return FileManager.default.currentDirectoryPath+"/"+path
	}
}

func writeFile(filePath path:String, fileContents cont:Data, printProgress prints:Bool) {
	let fileURL = URL(fileURLWithPath: path)
	if prints {print("Starting write to \(fileURL)")}
	do {
		try cont.write(to: fileURL)
		if prints {print("Finished write")}
	} catch let caterr{
		print("err:FileWriting:\(caterr)")
	}
}
