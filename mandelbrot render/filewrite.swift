//
//  filewrite.swift
//  mandelbrot render
//
//  Created by Teddy Gaillard on 2/2/19.
//  Copyright © 2019 thegail. All rights reserved.
//

import Foundation

func writeFile(filePath path:String, fileContents cont:Data, printProgress prints:Bool) {
	if let dir = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first {
		let fileURL = dir.appendingPathComponent(path)
		do {
			try cont.write(to: fileURL)
			if prints {print("Finished write")}
		} catch let caterr{
			print("err:FileWriting:\(caterr)")
		}
	} else {
		print("err:noexec")
	}
}
