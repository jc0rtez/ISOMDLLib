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
            url: "https://github.com/jc0rtez/kmpisolibtest/releases/download/1.0.0/ISOMDLLib.xcframework.zip",
            checksum: "bd2fd9489f5828e33644f13c00f64b794004890b084b44fc50c1db78cae917f7"
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
