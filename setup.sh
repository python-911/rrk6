#!/bin/bash

echo "🚀 Setting up ..."
echo ""

# Update package list
echo "📦 Updating package list..."
sudo apt-get update -qq

# Install k6 if not already installed
if ! command -v k6 &> /dev/null; then
    echo "📥 Installing k6..."
    sudo gpg -k
    sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
    echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
    sudo apt-get update
    sudo apt-get install k6 -y
    echo "✅ k6 installed successfully!"
else
    echo "✅ k6 is already installed"
fi

echo ""
echo "✅ Setup completed successfully!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
