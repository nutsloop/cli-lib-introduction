rm -rf "./bin" || true
rm -rf "./lib" || true
rm -rf "./node_modules" || true
rm -rf "./types" || true
if [ -f "./index.js" ]; then rm "./index.js"; fi
if [ -f "./package-lock.json" ]; then rm "./package-lock.json"; fi
