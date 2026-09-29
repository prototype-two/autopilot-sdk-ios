// swift-tools-version: 5.9

// ──────────────────────────────────────────────────────────────────────
// Autopilot Mobile SDK — SPM Distribution Package (repository root)
//
// Binary XCFrameworks are published to the *public* SPM distribution repo below
// (see gradle.properties spm.dist.repository). SwiftPM downloads those URLs without
// GitHub session auth. Source code stays in the private autopilot-sdk monorepo.
// Fastlane syncs this file and uploads ZIPs to that public repo on each release.
//
// Frameworks shipped:
//   MobileApi              — sealed events, AnalyticsClient contract (required)
//   MobileCore             — analytics engine (required)
//   MobileAdapterFirebase  — Firebase Analytics / RemoteConfig
//   MobileAdapterAmplitude — Amplitude Analytics
//   MobileAdapterAppsFlyer — AppsFlyer attribution
//   MobileAdapterBraze     — Braze identity/CRM attributes
//
// iOS apps add MobileApi + MobileCore, plus the adapters they use.
// ──────────────────────────────────────────────────────────────────────

import PackageDescription

let version = "2.7.0"
// Must match gradle.properties `spm.dist.repository` (owner/repo of the public dist repo).
let binaryReleaseRepo = "prototype-two/autopilot-sdk-ios"
let baseUrl = "https://github.com/\(binaryReleaseRepo)/releases/download/v\(version)"

let package = Package(
    name: "AutopilotSDK",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "MobileApi",               targets: ["MobileApi"]),
        .library(name: "MobileCore",              targets: ["MobileCore"]),
        .library(name: "MobileAdapterFirebase",   targets: ["MobileAdapterFirebase"]),
        .library(name: "MobileAdapterAmplitude",  targets: ["MobileAdapterAmplitude"]),
        .library(name: "MobileAdapterAppsFlyer",  targets: ["MobileAdapterAppsFlyer"]),
        .library(name: "MobileAdapterBraze",      targets: ["MobileAdapterBraze"]),
    ],
    targets: [
        // ── Api (required — sealed events + AnalyticsClient contract) ──
        .binaryTarget(
            name: "MobileApi",
            url: "\(baseUrl)/MobileApi.xcframework.zip",
            checksum: "6daf073749e685b2e483073fa347affc3ee635a30207c64638eacc2317aa9086"
        ),

        // ── Core (required — analytics engine) ─────────────────────────
        .binaryTarget(
            name: "MobileCore",
            url: "\(baseUrl)/MobileCore.xcframework.zip",
            checksum: "cba79fe9fb56c61173c0d6f52f727a323e3a2bd378c0c8aade80a17ff71010e4"
        ),

        // ── Firebase adapter ────────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterFirebase",
            url: "\(baseUrl)/MobileAdapterFirebase.xcframework.zip",
            checksum: "9efc0ba5bff1d3073c52a0db21d1b620d4292d9890240d841a24772de07df975"
        ),

        // ── Amplitude adapter ───────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterAmplitude",
            url: "\(baseUrl)/MobileAdapterAmplitude.xcframework.zip",
            checksum: "c06e8ed1c9bc77e120725c8291c49ae0dfc98c9ab3c6a3ea6e3830f7b815d170"
        ),

        // ── AppsFlyer adapter ───────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterAppsFlyer",
            url: "\(baseUrl)/MobileAdapterAppsFlyer.xcframework.zip",
            checksum: "8a298364044776d0053287a73e4579520b2d31648288bfbab380dd49a4420fbb"
        ),

        // ── Braze adapter ───────────────────────────────────────────────
        // First shipped in the release after 2.2.0; the placeholder checksum
        // below is rewritten by fastlane (update_package_swift) at release time.
        .binaryTarget(
            name: "MobileAdapterBraze",
            url: "\(baseUrl)/MobileAdapterBraze.xcframework.zip",
            checksum: "10d23f2c81ed907a902e6f6dc96bd29c8ad742070975c91fba0f9c408804b94b"
        ),
    ]
)
