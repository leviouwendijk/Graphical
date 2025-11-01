// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Graphical",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Graphical",
            targets: ["Graphical"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/leviouwendijk/plate.git",
            branch: "master"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Graphical",
            dependencies: [
                .product(name: "plate", package: "plate"),
            ],
        ),
        .testTarget(
            name: "GraphicalTests",
            dependencies: ["Graphical"]
        ),
    ]
)
