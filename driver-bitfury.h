/*
 * Copyright 2013 Con Kolivas
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 3 of the License, or (at your option)
 * any later version.  See COPYING for more details.
 */

#ifndef BITFURY_H
#define BITFURY_H

#include "miner.h"
#include "usbutils.h"

struct bitfury_info {
	struct cgpu_info *base_cgpu;
	uint8_t version;
	char product[8];
	uint32_t serial;
	char buf[512];
	int nonces;
	int total_nonces;
	double saved_nonces;
	int cycles;
	struct timeval tv_start;
};

#endif /* BITFURY_H */
