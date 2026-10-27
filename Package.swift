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

let version = "2.12.2"
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
            checksum: "cb248fdb4b4796b4fa521944bc1a4b7f0536fad32d85806cb813d50942799d38"
        ),

        // ── Core (required — analytics engine) ─────────────────────────
        .binaryTarget(
            name: "MobileCore",
            url: "\(baseUrl)/MobileCore.xcframework.zip",
            checksum: "b4e318f637a232bfa220b98bd015fc76fd6386b6ba086cded6f9c8eb3166692d"
        ),

        // ── Firebase adapter ────────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterFirebase",
            url: "\(baseUrl)/MobileAdapterFirebase.xcframework.zip",
            checksum: "bea6d6c8a918395da6b0f8061ede234dbdcc8acccf9b22111a4a1b3640b1d2a9"
        ),

        // ── Amplitude adapter ───────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterAmplitude",
            url: "\(baseUrl)/MobileAdapterAmplitude.xcframework.zip",
            checksum: "0708fbca61cfb260ef095d02415bab9c4ecf1726baa67982b2043600acc15f45"
        ),

        // ── AppsFlyer adapter ───────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterAppsFlyer",
            url: "\(baseUrl)/MobileAdapterAppsFlyer.xcframework.zip",
            checksum: "13330e6bdd42278daa0c3b6861d443f856cff5f327648af09d177028b5441d33"
        ),

        // ── Braze adapter ───────────────────────────────────────────────
        // First shipped in the release after 2.2.0; the placeholder checksum
        // below is rewritten by fastlane (update_package_swift) at release time.
        .binaryTarget(
            name: "MobileAdapterBraze",
            url: "\(baseUrl)/MobileAdapterBraze.xcframework.zip",
            checksum: "c05a8d7a77b4066e2e45fc6ff2ae330b8940760cef6c2b7b31cd13a6f0299799"
        ),
    ]
)
