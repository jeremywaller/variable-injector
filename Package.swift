// swift-tools-version:5.2.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "variable-injector",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(
            name: "variable-injector",
            targets: ["variable-injector"]),        
    ],
    dependencies: [
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("swift-5.4-DEVELOPMENT-SNAPSHOT-2021-03-25-a")),
        .package(name: "swift-argument-parser", url: "https://github.com/apple/swift-argument-parser.git", .exact("0.4.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "variable-injector-core",
            dependencies: [
                .product(name: "SwiftSyntax", package: "SwiftSyntax"), 
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            path: "Sources/variable-injector/Core"),
        .target(
            name: "variable-injector",
            dependencies: ["variable-injector-core"],
            path: "Sources/variable-injector/Tool"),
        .testTarget(
            name: "variable-injectorTests",
            dependencies: ["variable-injector-core"]),
    ]
)
