/*
 * Copyright © 2007-2017 Intel Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 *
 */

#ifndef INTEL_AUB_WRITE
#define INTEL_AUB_WRITE

#include <stdint.h>
#include <stdio.h>

#include "drm-uapi/i915_drm.h"

#include "dev/gen_device_info.h"
#include "common/gen_gem.h"

#ifdef __cplusplus
extern "C" {
#endif

#define MAX_CONTEXT_COUNT 64

struct aub_ppgtt_table {
   uint64_t phys_addr;
   struct aub_ppgtt_table *subtables[512];
};

struct aub_hw_context {
   bool initialized;
   uint64_t ring_addr;
   uint64_t pphwsp_addr;
};

/* GEM context, as seen from userspace */
struct aub_context {
   uint32_t id;
   struct aub_hw_context hw_contexts[I915_ENGINE_CLASS_VIDEO + 1];
};

struct aub_file {
   FILE *file;

   bool has_default_setup;

   /* Set if you want extra logging */
   FILE *verbose_log_file;

   uint16_t pci_id;
   struct gen_device_info devinfo;

   int addr_bits;

   struct aub_ppgtt_table pml4;
   uint64_t phys_addrs_allocator;
   uint64_t ggtt_addrs_allocator;

   struct {
      uint64_t hwsp_addr;
   } engine_setup[I915_ENGINE_CLASS_VIDEO_ENHANCE + 1];

   struct aub_context contexts[MAX_CONTEXT_COUNT];
   int num_contexts;

   uint32_t next_context_handle;
};

void aub_file_init(struct aub_file *aub, FILE *file, FILE *debug, uint16_t pci_id, const char *app_name);
void aub_file_finish(struct aub_file *aub);

static inline bool aub_use_execlists(const struct aub_file *aub)
{
   return aub->devinfo.gen >= 8;
}

uint32_t aub_gtt_size(struct aub_file *aub);

static inline void
aub_write_reloc(const struct gen_device_info *devinfo, void *p, uint64_t v)
{
   if (devinfo->gen >= 8) {
      *(uint64_t *)p = gen_canonical_address(v);
   } else {
      *(uint32_t *)p = v;
   }
}

void aub_write_default_setup(struct aub_file *aub);
void aub_map_ppgtt(struct aub_file *aub, uint64_t start, uint64_t size);
void aub_write_ggtt(struct aub_file *aub, uint64_t virt_addr, uint64_t size, const void *data);
void aub_write_trace_block(struct aub_file *aub,
                           uint32_t type, void *virtual,
                           uint32_t size, uint64_t gtt_offset);
void aub_write_exec(struct aub_file *aub, uint32_t ctx_id, uint64_t batch_addr,
                    uint64_t offset, enum drm_i915_gem_engine_class engine_class);
void aub_write_context_execlists(struct aub_file *aub, uint64_t context_addr,
                                 enum drm_i915_gem_engine_class engine_class);

uint32_t aub_write_context_create(struct aub_file *aub, uint32_t *ctx_id);

#ifdef __cplusplus
}
#endif

#endif /* INTEL_AUB_WRITE */
