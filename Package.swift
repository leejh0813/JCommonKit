// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JCommonKit",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "JCommonKit",
            targets: ["JCommonKit"]),
    ],
    dependencies: [
        // 패키지 추가
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.5.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "JCommonKit",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios")
            ],
            resources: [
                .process("Sources/JCommonKit/Resource")
            ]
        ),
    ]
)
