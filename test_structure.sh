#!/bin/bash

echo "🔍 TESTING MyHotSlots Multi-Page Structure"
echo "=========================================="
echo ""

# Test 1: Check all main files exist
echo "✅ Test 1: Main Files"
files=("index.html" "styles.css" "script.js" "sitemap.xml" "robots.txt" "README.md" "favicon.ico")
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✓ $file exists"
    else
        echo "  ✗ $file MISSING!"
    fi
done

echo ""

# Test 2: Check directories
echo "✅ Test 2: Directories"
dirs=("assets" "bonuses" "reviews" "casinos")
for dir in "${dirs[@]}"; do
    if [ -d "$dir" ]; then
        echo "  ✓ $dir/ exists"
    else
        echo "  ✗ $dir/ MISSING!"
    fi
done

echo ""

# Test 3: Check assets
echo "✅ Test 3: Assets"
assets=("myhoticon2.png" "green-luck.png" "metal-casino.png" "gamblingo.png" "boho-casino.png")
for asset in "${assets[@]}"; do
    if [ -f "assets/$asset" ]; then
        echo "  ✓ assets/$asset exists"
    else
        echo "  ✗ assets/$asset MISSING!"
    fi
done

echo ""

# Test 4: Check category pages
echo "✅ Test 4: Category Index Pages"
pages=("bonuses/index.html" "reviews/index.html" "casinos/index.html")
for page in "${pages[@]}"; do
    if [ -f "$page" ]; then
        echo "  ✓ $page exists"
    else
        echo "  ✗ $page MISSING!"
    fi
done

echo ""

# Test 5: Check review pages
echo "✅ Test 5: Individual Review Pages"
reviews=("green-luck-casino.html" "metal-casino.html" "gamblingo-casino.html" "betmgm-casino.html" "boho-casino.html")
for review in "${reviews[@]}"; do
    if [ -f "reviews/$review" ]; then
        echo "  ✓ reviews/$review exists"
    else
        echo "  ✗ reviews/$review MISSING!"
    fi
done

echo ""

# Test 6: Count total files
echo "✅ Test 6: File Count Summary"
html_files=$(find . -name "*.html" | wc -l)
css_files=$(find . -name "*.css" | wc -l)
js_files=$(find . -name "*.js" | wc -l)
img_files=$(find assets/ -type f 2>/dev/null | wc -l)

echo "  HTML files: $html_files"
echo "  CSS files: $css_files"
echo "  JS files: $js_files"
echo "  Images: $img_files"

echo ""

# Test 7: Check HTML validity (basic)
echo "✅ Test 7: HTML Structure Check"
for html in index.html bonuses/index.html reviews/index.html casinos/index.html; do
    if [ -f "$html" ]; then
        if grep -q "<!DOCTYPE html>" "$html" && grep -q "</html>" "$html"; then
            echo "  ✓ $html has valid structure"
        else
            echo "  ✗ $html has INVALID structure"
        fi
    fi
done

echo ""

# Test 8: Check for essential meta tags
echo "✅ Test 8: SEO Meta Tags"
for html in index.html bonuses/index.html reviews/index.html; do
    if [ -f "$html" ]; then
        has_title=$(grep -c "<title>" "$html")
        has_desc=$(grep -c "name=\"description\"" "$html")
        has_canonical=$(grep -c "rel=\"canonical\"" "$html")
        
        if [ $has_title -gt 0 ] && [ $has_desc -gt 0 ] && [ $has_canonical -gt 0 ]; then
            echo "  ✓ $html has essential meta tags"
        else
            echo "  ⚠ $html missing some meta tags"
        fi
    fi
done

echo ""

# Test 9: Check sitemap
echo "✅ Test 9: Sitemap Validation"
if [ -f "sitemap.xml" ]; then
    urls=$(grep -c "<url>" sitemap.xml)
    echo "  ✓ sitemap.xml contains $urls URLs"
else
    echo "  ✗ sitemap.xml MISSING!"
fi

echo ""

# Test 10: File sizes
echo "✅ Test 10: File Sizes"
if [ -f "styles.css" ]; then
    css_size=$(wc -c < styles.css)
    echo "  styles.css: $css_size bytes"
fi

if [ -f "script.js" ]; then
    js_size=$(wc -c < script.js)
    echo "  script.js: $js_size bytes"
fi

echo ""
echo "=========================================="
echo "🎉 TESTING COMPLETE!"
echo "=========================================="
