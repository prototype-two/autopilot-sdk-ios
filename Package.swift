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

let version = "2.18.0"
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
            checksum: "f8971456880657deb680d2e7c501a3f641915a82290599b1d962de420adc98aa"
        ),

        // ── Core (required — analytics engine) ─────────────────────────
        .binaryTarget(
            name: "MobileCore",
            url: "\(baseUrl)/MobileCore.xcframework.zip",
            checksum: "a9132c4b4aabf4893fea773a83ea2765064e416ba421146e4ba2e6533f595e51"
        ),

        // ── Firebase adapter ────────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterFirebase",
            url: "\(baseUrl)/MobileAdapterFirebase.xcframework.zip",
            checksum: "caea37de4fb9da900dd9ca47d3ae12b3c3c660f131151dc956610e82bc095674"
        ),

        // ── Amplitude adapter ───────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterAmplitude",
            url: "\(baseUrl)/MobileAdapterAmplitude.xcframework.zip",
            checksum: "0afc2e3dee29e01bc5ef1308bf8639f05ebac49fe1b6ed1ee6d9834107e8733c"
        ),

        // ── AppsFlyer adapter ───────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterAppsFlyer",
            url: "\(baseUrl)/MobileAdapterAppsFlyer.xcframework.zip",
            checksum: "1ad3359465cfa9e3cbadec29442e9fea849d4656f412638c1d9c7ca89fff4d16"
        ),

        // ── Braze adapter ───────────────────────────────────────────────
        // First shipped in the release after 2.2.0; the placeholder checksum
        // below is rewritten by fastlane (update_package_swift) at release time.
        .binaryTarget(
            name: "MobileAdapterBraze",
            url: "\(baseUrl)/MobileAdapterBraze.xcframework.zip",
            checksum: "cc50d0590a80eea4b2b381402b1aacc31f084817b90b42d809a236a1ff44bffd"
        ),
    ]
)
