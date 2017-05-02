#!/usr/bin/env bash

# Copyright 2017-Present Pivotal Software, Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eu

cat > cliaas-config/gcpcreds.json <<EOF
${OPSMAN_GCP_CREDFILE_CONTENTS}
EOF

DISK_IMAGE_PATH=$(grep ${PIVNET_IMAGE_REGION} pivnet-opsmgr/*GCP.yml | awk '{split($0, a); print a[2]}')

cat > cliaas-config/config.yml <<EOF
gcp:
  credfile: cliaas-config/gcpcreds.json
  zone: ${OPSMAN_ZONE}
  project: ${OPSMAN_PROJECT}
  disk_image_url: ${DISK_IMAGE_PATH}
EOF
