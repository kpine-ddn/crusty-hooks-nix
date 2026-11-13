{
  lib,
  rustPlatform,
  fetchCrate,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "crusty-hooks";
  version = "0.1.0";

  src = fetchCrate {
    inherit (finalAttrs) pname version;
    hash = "sha256-EcG7hbCnOfVweZVxJq6G97TxGGtoD6ke2n8UykqWPEE=";
  };

  cargoHash = "sha256-JqfpoGtWJhHnlI2uUxiQYzjit/idRR1nM2+vdmue7XQ=";

  meta = {
    description = "git hook manager, geared toward Rust projects";
    homepage = "https://github.com/whamcloud/crusty-hooks";
    license = lib.licenses.mit;
    mainProgram = "crusty-hooks";
  };
})
