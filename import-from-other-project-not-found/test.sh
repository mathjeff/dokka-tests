set -e
cd "$(dirname $0)"
find -name build | xargs --no-run-if-empty rm -rf

echo Project differences:
diff -r jefflibA jefflibB || true
echo
./gradlew dokka
echo
echo Some output differences:
diff jefflibA/build/dokka/jefflib-a/com.jeffclass2/-jeff-class2/index.html jefflibB/build/dokka/jefflib-b/com.jeffclass2/-jeff-class2/index.html | grep "Sample method" | grep --color 'href="[^"]*"' || true
echo Notice that the reference from the jefflibB project fails to link to com.jeffclass.JeffClass#STATIC_FIELD or to com.jeffclass.JeffClass#memberField


