#!/bin/bash

echo "=== Testing GitHub Connection ==="
echo ""

# Check if remote is configured
echo "Checking remote configuration..."
git remote -v
echo ""

# Test fetch (should work without auth)
echo "Testing fetch from GitHub..."
if git fetch origin; then
    echo "✅ Fetch successful"
else
    echo "❌ Fetch failed - check your internet connection"
    exit 1
fi

# Test push
echo ""
echo "Testing push to GitHub..."
if git push origin main; then
    echo "✅ Push successful!"
    echo "Your code is now on GitHub!"
else
    echo "❌ Push failed - authentication issue"
    echo ""
    echo "Please set up GitHub authentication:"
    echo "1. Personal Access Token: https://github.com/settings/tokens"
    echo "2. Or SSH key: ssh-keygen, then add to GitHub"
    echo "3. Or GitHub CLI: gh auth login"
    exit 1
fi

echo ""
echo "🎉 GitHub connection is working perfectly!"
