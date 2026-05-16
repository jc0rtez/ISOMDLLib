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
            url: "https://github.com/jc0rtez/ISOMDLLib/releases/download/1.0.4/ISOMDLLib.xcframework.zip",
            checksum: "81692d1da396df307280dc06354a55fb2dd6b70a1cf27bfb19f0e27e273cfb28"
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
