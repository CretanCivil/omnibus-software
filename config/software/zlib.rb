#
# Copyright:: Copyright (c) 2012 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "zlib"
version "1.2.6"

dependency "libgcc"

# TODO: this link is subject to change with each new release of zlib.
#       we'll need to use a more robust link (sourceforge) that will
#       not change over time.
source :url => "http://downloads.sourceforge.net/project/libpng/zlib/1.2.6/zlib-1.2.6.tar.gz",
       :md5 => "618e944d7c7cd6521551e30b32322f4a"

relative_path "zlib-1.2.6"

default_env['CFLAGS'] << ' -DNO_VIZ' if platform == "solaris2"

build do
  command "./configure --prefix=#{install_dir}/embedded"
  command "make -j #{max_build_jobs}"
  command "make -j #{max_build_jobs} install"
end
