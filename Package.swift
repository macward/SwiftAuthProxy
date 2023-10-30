// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAuthProxy",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "SwiftAuthProxy",
            targets: ["SwiftAuthProxy"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "10.16.0")),
    ],
    targets: [
        .target(
            name: "SwiftAuthProxy", 
            dependencies: [
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAuthCombine-Community", package: "firebase-ios-sdk")
            ]),
        .testTarget(
            name: "SwiftAuthProxyTests",
            dependencies: ["SwiftAuthProxy"]),
    ]
)
