# Install from source in `/usr/local`
https://github.com/neovim/neovim/wiki/Building-Neovim

```sh
sudo make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

# prerequisite: `cmake 3` from sources
```sh
openssl-devel
./bootstrap --prefix=/usr/local/cmake3
gmake
sudo gmake install
```

remove installed files with: `parallel --xargs rm < install_manifest.txt`

## `cmake` links
```sh
sudo alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake 10 \
--slave /usr/local/bin/ctest ctest /usr/bin/ctest \
--slave /usr/local/bin/cpack cpack /usr/bin/cpack \
--slave /usr/local/bin/ccmake ccmake /usr/bin/ccmake \
--family cmake

sudo alternatives --install /usr/local/bin/cmake cmake /usr/local/cmake3/bin/cmake 20 \
--slave /usr/local/bin/ctest ctest /usr/local/cmake3/bin/ctest \
--slave /usr/local/bin/cpack cpack /usr/local/cmake3/bin/cpack \
--slave /usr/local/bin/ccmake ccmake /usr/local/cmake3/bin/ccmake \
--family cmake

mv /usr/bin/cmake{,.old}
ln -s /usr/local/cmake3/bin/cmake /usr/bin/
```
