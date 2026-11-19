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

let version = "2.15.0"
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
            checksum: "de0b7f1b45d324ba8daea388f1f4ff8bb7973c51b3febc96593c9b2d081c7a80"
        ),

        // ── Core (required — analytics engine) ─────────────────────────
        .binaryTarget(
            name: "MobileCore",
            url: "\(baseUrl)/MobileCore.xcframework.zip",
            checksum: "e5200a69c5c2f0fa83c96390f2631ef80b135bef92e59ac82c8e83c95e0f53fb"
        ),

        // ── Firebase adapter ────────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterFirebase",
            url: "\(baseUrl)/MobileAdapterFirebase.xcframework.zip",
            checksum: "6db6755477a699e634f82e083394fe9d959e9602f084218f6b446e987d02a891"
        ),

        // ── Amplitude adapter ───────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterAmplitude",
            url: "\(baseUrl)/MobileAdapterAmplitude.xcframework.zip",
            checksum: "b314ff2a7db57a1311fa96bfda2814b569cb79f9a247c86081d0b3e54db756fd"
        ),

        // ── AppsFlyer adapter ───────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterAppsFlyer",
            url: "\(baseUrl)/MobileAdapterAppsFlyer.xcframework.zip",
            checksum: "fa5b9e2c19a61456a7be346938c4a6f128cf4d8a4655b510ec7f00bbb02963e7"
        ),

        // ── Braze adapter ───────────────────────────────────────────────
        // First shipped in the release after 2.2.0; the placeholder checksum
        // below is rewritten by fastlane (update_package_swift) at release time.
        .binaryTarget(
            name: "MobileAdapterBraze",
            url: "\(baseUrl)/MobileAdapterBraze.xcframework.zip",
            checksum: "322d79648a4858033ebfbba396fff53d84569fc27b846e3ff980e37ab59c9cf1"
        ),
    ]
)
