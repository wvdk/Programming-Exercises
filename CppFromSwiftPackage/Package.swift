// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CppFromSwift",
//    products: [
//        .library(name: "cpplib", targets: "")
//    ]
    targets: [
        .target(name: "cpplib"),
        .target(name: "cpp-exec", dependencies: ["cpplib"]),
        .target(name: "cwrapper", dependencies: ["cpplib"]),
        .target(name: "swift-exec", dependencies: ["cwrapper"]),
    ]
)
