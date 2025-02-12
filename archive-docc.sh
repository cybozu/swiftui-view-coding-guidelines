#/usr/bin/env bash -euo pipefail

DOCC_COMMAND="/usr/bin/xcrun docc"
DOCC_ARCHIVE="Guide.doccarchive"

$DOCC_COMMAND convert Guide.docc \
  --fallback-display-name SwiftUIViewCodingGuidelines \
  --fallback-bundle-identifier org.cybozu.SwiftUIViewCodingGuidelines \
  --fallback-bundle-version 1 \
  --output-dir $DOCC_ARCHIVE
  --hosting-base-path swiftui-view-coding-guidelines

$DOCC_COMMAND process-archive transform-for-static-hosting \
  --output-path ./docs \
  $DOCC_ARCHIVE
