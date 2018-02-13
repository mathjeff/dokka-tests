set -e
cd "$(dirname $0)"
find -name build | xargs --no-run-if-empty rm -rf
echo Project differences:
diff -r jefflib-with-kotlin-android-plugin jefflib-without-kotlin-android-plugin || true
echo
./gradlew dokka
echo
echo index-outline.html sizes:
find -name index-outline.html | xargs wc -l | sort -n
echo Notice that the two projects produce different results
