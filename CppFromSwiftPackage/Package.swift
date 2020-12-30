// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CppFromSwift",
    targets: [
        .target(name: "cpplib"),
        .target(name: "cpp-exec", dependencies: ["cpplib"]),
        .target(name: "cwrapper", dependencies: ["cpplib"]),
        .target(name: "swift-exec", dependencies: ["cwrapper"]),
    ]
)
