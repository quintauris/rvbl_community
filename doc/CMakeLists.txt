#[[
  Copyright 2026 Quintauris GmbH
  Licensed under the Apache License, Version 2.0 (the "License").
  https://www.apache.org/licenses/LICENSE-2.0
]]

cmake_minimum_required(VERSION 3.28)
project(distribution_doc)

set(layers core riscv gnu llvm qemu)

foreach(layer ${layers})
    add_subdirectory(../${layer}/doc ${layer})
endforeach()

find_program(ASCIIDOCTOR NAMES asciidoctor REQUIRED)
set(target_directory ${CMAKE_CURRENT_SOURCE_DIR}/html)
make_directory(${target_directory})

add_custom_command(
    OUTPUT ${target_directory}/index.html
    COMMAND ${ASCIIDOCTOR} --doctype book -D ${target_directory} ${CMAKE_CURRENT_SOURCE_DIR}/index.adoc
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/index.adoc
    COMMENT "Generating index documentation...")

add_custom_target(
    distribution_docs ALL DEPENDS ${target_directory}/index.html)

install(FILES ${target_directory}/index.html DESTINATION doc)