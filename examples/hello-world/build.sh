#@IgnoreInspection BashAddShebang

# Initial cleanup
pebble clean
cargo clean

target="thumbv7m-none-eabi"

# Build the project through Cargo
cargo --version
cargo build --target $target --release || exit 1

cd target/$target/release/deps

# Extract the archive
ar x *.a

# Remove all the mess produced by Rust (shouldn't be a problem if you use the 'compiler-builtins' crate).
find . -type f ! -name '*.rcgu.o' -delete

cd -

# Build through waf
#pebble build
