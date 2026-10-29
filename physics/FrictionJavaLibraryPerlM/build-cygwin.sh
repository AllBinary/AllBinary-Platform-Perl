#!/usr/bin/env bash

# Builds a Perl module tree from the generated Perl sources and checks each module compiles with perl -c.
# The generated code loads classes with use org::allbinary::string::CommonSeps which Perl finds as org/allbinary/string/CommonSeps.pm on @INC.
# The converter writes .pl files so they are copied as .pm files. Dependency jars already contain .pm files.

set -uo pipefail

export PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

source_dir="$(cygpath -u "$1")"
lib_dir="$(cygpath -u "$2")"
dependency_lib_dir="$(cygpath -u "$3")"
# Perl can be a Windows install such as Strawberry Perl so it is given G:/ style paths
perl="$(cygpath -u "$4")"
fail_on_error="$5"
shift 5

rm -rf "$lib_dir" "$dependency_lib_dir"
mkdir -p "$lib_dir" "$dependency_lib_dir"

copy_modules() {
    local input_dir="$1"
    local output_dir="$2"
    local source
    local module
    while IFS= read -r -d '' source; do
        module="$output_dir/${source#"$input_dir"/}"
        case "$module" in
            *.pl) module="${module%.pl}.pm" ;;
        esac
        mkdir -p "$(dirname "$module")"
        cp "$source" "$module"
    done < <(find "$input_dir" -type f \( -name '*.pl' -o -name '*.pm' \) -print0)
}

# Dependencies such as the jsinterop annotations are only used for checking the library modules. They are the source directories or the META-INF/perl/lib directories unpacked from dependency jars.
for dependency_dir in "$@"; do
    dependency_dir="$(cygpath -u "$dependency_dir")"
    if [ -d "$dependency_dir" ]; then
        copy_modules "$dependency_dir" "$dependency_lib_dir"
    else
        echo "Warning: Perl dependency source directory does not exist: $dependency_dir" >&2
    fi
done

copy_modules "$source_dir" "$lib_dir"

compiled=0
failures=()

# Each module is loaded with require by its @INC path like use does. perl -c on the file would compile it a 2nd time when a module it uses uses it back and warn that every sub is redefined.
# Like use, require also runs the module's top level code such as our $instance = ...->new().
while IFS= read -r -d '' module; do
    if "$perl" -I "$(cygpath -m "$lib_dir")" -I "$(cygpath -m "$dependency_lib_dir")" -e 'require $ARGV[0]; print STDERR "$ARGV[1] syntax OK\n";' "${module#"$lib_dir"/}" "$(cygpath -m "$module")"; then
        compiled=$((compiled + 1))
    else
        failures+=("$module")
    fi
done < <(find "$lib_dir" -type f -name '*.pm' -print0 | sort -z)

echo "Perl modules compiled: $compiled"
if [ "${#failures[@]}" -gt 0 ]; then
    echo "Perl build failures: ${#failures[@]}" >&2
    printf '  %s\n' "${failures[@]}" >&2
    if [ "$fail_on_error" = "true" ]; then
        exit 1
    fi
fi
exit 0
