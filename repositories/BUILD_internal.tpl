# This file is generated by rabbitmq-server via the elixir_config macro

load(
    "@rules_elixir//:elixir_build.bzl",
    "elixir_build",
)
load(
    "@rules_elixir//:elixir_toolchain.bzl",
    "elixir_toolchain",
)

elixir_build(
    name = "elixir_build",
    url = "%{URL}",
    strip_prefix = "%{STRIP_PREFIX}",
    sha256v = "%{SHA_256}",
)

elixir_toolchain(
    name = "elixir",
    elixir = ":elixir_build",
    visibility = ["//visibility:public"],
)

toolchain(
    name = "toolchain",
    exec_compatible_with = [
        "//:elixir_internal",
    ],
    target_compatible_with = [
        "//:elixir_%{ELIXIR_VERSION_ID}",
    ],
    toolchain = ":elixir",
    toolchain_type = "@rules_elixir//:toolchain_type",
    visibility = ["//visibility:public"],
)
