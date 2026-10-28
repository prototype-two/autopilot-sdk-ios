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

let version = "2.13.0"
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
            checksum: "fdb167b09ab802b0a6468afa7dc34bec58c3834c91923bc3cacc7d6dfdebed20"
        ),

        // ── Core (required — analytics engine) ─────────────────────────
        .binaryTarget(
            name: "MobileCore",
            url: "\(baseUrl)/MobileCore.xcframework.zip",
            checksum: "1c59ea42809d67299eb06a7927100a00b8d19062ad57ee6bd799ad577a1b7893"
        ),

        // ── Firebase adapter ────────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterFirebase",
            url: "\(baseUrl)/MobileAdapterFirebase.xcframework.zip",
            checksum: "72229b587017d7f18ff3a8c9d95aa9050199e5d53d2232581f643ae79d6af18c"
        ),

        // ── Amplitude adapter ───────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterAmplitude",
            url: "\(baseUrl)/MobileAdapterAmplitude.xcframework.zip",
            checksum: "7cb37946eee97d8e68f14e1c824e188582e86a078c69f002244087848d8040c1"
        ),

        // ── AppsFlyer adapter ───────────────────────────────────────────
        .binaryTarget(
            name: "MobileAdapterAppsFlyer",
            url: "\(baseUrl)/MobileAdapterAppsFlyer.xcframework.zip",
            checksum: "b7a2d268a3a8df149ef8e004df38539e3f5fc85fceb5dcb05c4c670cb8f5a668"
        ),

        // ── Braze adapter ───────────────────────────────────────────────
        // First shipped in the release after 2.2.0; the placeholder checksum
        // below is rewritten by fastlane (update_package_swift) at release time.
        .binaryTarget(
            name: "MobileAdapterBraze",
            url: "\(baseUrl)/MobileAdapterBraze.xcframework.zip",
            checksum: "fc5ea2ae24cc5194ac656d0b233d79159f199d959a2b00a0a5af5044da1cc2b5"
        ),
    ]
)
