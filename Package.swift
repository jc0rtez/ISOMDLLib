// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ISOMDLLib",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ISOMDLLib",
            targets: ["ISOMDLLibWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/sqlcipher/SQLCipher.swift", exact: "4.16.0")
    ],
    targets: [
        .binaryTarget(
            name: "ISOMDLLib",
            url: "https://github.com/jc0rtez/ISOMDLLib/releases/download/1.0.6/ISOMDLLib.xcframework.zip",
            checksum: "b5899d0ab3415fb127392d7878b1cb03cffb2371a1127e3bf1c724f5a2763147"
        ),
        .target(
            name: "ISOMDLLibWrapper",
            dependencies: [
                .target(name: "ISOMDLLib"),
                .product(name: "SQLCipher", package: "SQLCipher.swift")
            ],
            path: "Sources/Wrapper"
        )
    ]
)
