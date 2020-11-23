// Copyright 2019 yuzu Emulator Project
// Licensed under GPLv2 or any later version
// Refer to the license.txt file included.

#pragma once

// Included just because vulkan_metal.h defines CAMetalLayer:
#include "vulkan/vulkan_core.h"
#include "vulkan/vulkan_macos.h"
#include "vulkan/vulkan_metal.h"

namespace Vulkan {

const CAMetalLayer* PrepareMetalView(void* render_surface);

void* NSWindowToContentView(void* window_ptr);

} // namespace Vulkan
