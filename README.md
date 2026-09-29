# The RISC-V Base Layer
Quintauris <www.quintauris.com>

## Overview

This manual introduces the RISC-V Base Layer project providing concepts, architecture, conventions, procedures and best practices for its users.

The RISC-V Base Layer is a collaborative effort devoted to building a common _low-level_ software enviroment for the for RISC-V ecosystem. "Low-level" in this context means that no software stack (e.g. bootloader, operating system, run-time libraries) is assumed to be present in the target machine.

### What's in the RISC-V Base Layer

* A well-documented, model-driven and modular software architecture
* A hardware (e.g. peripherals, machines, etc) meta-model definition
* A CMake-based build environment, including toolchain files
* Model to code generation tools
* Run-time libraries, including tests
* Machine configurations
* A build management tool to wrangle all of the above (`rave`)

### What's NOT in the RISC-V Base Layer

* An Operating System
* An Integrated Development Environment
* Hardware design/verification tools

## License

The RISC-V Base Layer is licensed under the Apache 2.0 license. See [LICENSE](LICENSE.txt) for details.

## Learn more

Detailed project documentation can be browsed at <https://rvbl.quintauris.com/community/doc>.

## Contact

Please email <rvbl-maintainer@quintauris.com>.