#!/bin/sh -e
# Copyright (c) 2013 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# Grabs the release from the specified chroot ($1) and prints it out on stdout.
# Fails with an error code of 1 if the chroot does not belong to this distro.

if [ -z "$1" ]; then
    echo "Usage: ${0##*/} chroot" 1>&2
    exit 2
fi

rel="`awk '{print tolower($1); exit}' "${1%/}/etc/gentoo-release"`"
if [ -z "$rel" ]; then
    exit 1
fi

echo "$rel"
exit 0
