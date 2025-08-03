#!/bin/bash

# Build Quartz site
echo "Building Quartz site..."
npx quartz build

echo "Build complete! Site is in the 'public' directory."
echo "To serve locally, run: npx serve public" 