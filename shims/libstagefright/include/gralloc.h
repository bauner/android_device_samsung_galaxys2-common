/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


#ifndef ANDROID_GRALLOC_INTERFACE_EXYNOS4_H
#define ANDROID_GRALLOC_INTERFACE_EXYNOS4_H

enum {
    /* SAMSUNG */
    GRALLOC_USAGE_PRIVATE_NONECACHE     = 0x00800000U,

    GRALLOC_USAGE_HW_FIMC1              = 0x01000000U,
    GRALLOC_USAGE_HW_ION                = 0x02000000U,
    GRALLOC_USAGE_YUV_ADDR              = 0x04000000U,
    GRALLOC_USAGE_CAMERA                = 0x08000000U,

    /* SEC Private usage , for Overlay path at HWC */
    GRALLOC_USAGE_HWC_HWOVERLAY         = 0x20000000U,
};
#endif
