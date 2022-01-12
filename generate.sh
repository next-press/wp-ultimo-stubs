#!/usr/bin/env bash
#
# Generate WP Ultimo stubs from the source directory.
#

HEADER=$'/**\n * Generated stub declarations for WP Ultimo.\n * @see https://wpultimo.com\n * @see https://github.com/next-press/wp-ultimo-stubs\n */'

FILE="wp-ultimo-stubs.php"

set -e

test -f "$FILE"
test -d "source/wp-ultimo"

# Exclude globals.
"$(dirname "$0")/vendor/bin/generate-stubs" \
    --force \
    --finder=finder.php \
    --header="$HEADER" \
    --functions \
    --classes \
    --interfaces \
    --traits \
    --out="$FILE"
# There are no WC functions to read these constants.
# See define_constants() in includes/class-woocommerce.php
#printf '\n%s\n' "define('WC_VERSION', '0.0.0');" >>"$FILE"
printf '\nnamespace {\n%s\n}\n' "define('WC_VERSION', '0.0.0');" >>"$FILE"

# FIXME Add modern core arguments.
##sed -e 's#^\s*public function feedback(\$string#&, ...$args#' -i "$FILE_PKGS"