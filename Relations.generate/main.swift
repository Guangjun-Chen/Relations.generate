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
    let allBuildFile = xcodeProj.pbxproj.objects.fileReferences
    allBuildFile.forEach { (object, fileReference) in
        print("object \(object) file \(fileReference.reference.hashValue) \(fileReference.path)")
        if fileReference.path == "main.swift",
            let file = allBuildFile[object] {
            
            print("YES")
        }
    }
    xcodeProj.pbxproj.objects.sourcesBuildPhases.forEach { (object, phase) in
        print("file \(object)")
    }
}
