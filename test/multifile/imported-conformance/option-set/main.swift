// RUN: %empty-directory(%t)

// RUN: %empty-directory(%t/linker)
// RUN: %target-build-swift -emit-module -emit-library %S/library.swift -o %t/linker/liblibrary.%target-dylib-extension -emit-module-path %t/linker/library.swiftmodule -module-name library
// RUN: %target-build-swift %S/main.swift -I %t/linker/ -L %t/linker/ -llibrary -o %t/linker/main

// REQUIRES: executable_test
// REQUIRES: objc_interop

import Foundation
import library

public func rreplace(rgx: NSRegularExpression, in: String, with: String, x: NSRange) -> String {
  return replace(rgx: rgx, in: `in`, with: with, x: x)
}
