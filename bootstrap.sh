#!/bin/sh

layers_root=$(dirname $(realpath $0))
build=${layers_root}/build/local
build_tool=${build}/tool

echo Bootstrapping into $layers_root ...

cd $layers_root
git submodule update --init --recursive
git submodule foreach pre-commit install
cd -

mkdir -p ${build}
rustup default 1.90

cargo build \
    --target-dir ${build_tool} \
    --manifest-path ${layers_root}/core/tool/Cargo.toml \
    --release

if [[ ":$PATH:" != *":${build_tool}/release:"* ]]; then
    export PATH="${PATH:+"$PATH:"}${build_tool}/release"
fi

export RVBL_ROOT=${layers_root}
export RVBL_BUILD=${build}
export RVBL_TOOL=${build_tool}/release

echo ""
echo "Now run 'rave' to get this party started. Fox example:"
echo ""
echo "> rave make --toolchain llvm.clang --toolchain-target default --machine qemu.virt --configure --build --test"
echo ""
echo "Or alternatively, configure and run a build in a Docker container:"
echo ""
echo "> rave docker --toolchain gnu.gcc --provision --up"
echo "> rave make --toolchain gnu.gcc --toolchain-target default --machine qemu.virt --configure --build --test --docker"
echo ""
echo "Run \"rave --help\" or \"rave <command> --help\" for more information."
