// Copyright 2018 yuzu Emulator Project
// Licensed under GPLv2 or any later version
// Refer to the license.txt file included.

#import <AppKit/AppKit.h>
#import <QuartzCore/QuartzCore.h>

#include "common/logging/log.h"

#include "video_core/renderer_vulkan/objc_helpers.h"

namespace Vulkan {

const CAMetalLayer* PrepareMetalView(void* render_surface) {
    NSLog(@"render_surface=%@", (id)render_surface);
    NSView* view = reinterpret_cast<NSView*>(render_surface);
    CAMetalLayer* layer = [CAMetalLayer layer];
    if (!layer) {
        LOG_ERROR(Render_Vulkan, "Failed to create Metal layer.");
        return nullptr;
    }
    view.wantsLayer = YES;
    view.layer = layer;
    layer.contentsScale = [[NSScreen mainScreen] backingScaleFactor];
    return layer;
}

void* NSWindowToContentView(void* window_ptr) {
    NSWindow* window = reinterpret_cast<NSWindow*>(window_ptr);
    return [window contentView];
}

} // namespace Vulkan
