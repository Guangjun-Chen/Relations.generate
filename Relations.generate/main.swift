//
//  main.swift
//  Relations.generate
//
//  Created by chengj on 9/8/18.
//  Copyright © 2018年 Kongen. All rights reserved.
//

import Foundation
import Basic
import xcodeproj

let argments = ProcessInfo.processInfo.arguments
let destinationPath = argments[1]

let absolutePath = AbsolutePath(destinationPath)
print("Generating .sql file for \(destinationPath)")

if let xcodeProj = try? XcodeProj(path: absolutePath) {
    let buildFiles = xcodeProj.pbxproj.objects.buildFiles
    xcodeProj.pbxproj.objects.sourcesBuildPhases.forEach { (object, phase) in
        print("build phase \(phase.reference.hashValue)")
        phase.fileReferences.forEach({ (objectReference) in
            let filePath = try? buildFiles[objectReference]?.file()?.path
            print("compile file: \(filePath)")
        })
//        print("path: \(try? buildFiles[phase.fileReferences[0]]?.file()?.path)")
    }
}
