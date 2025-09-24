#!/usr/bin/env bash
# --- Config ---
TPCDS_GIT_URL   ?= https://github.com/databricks/tpcds-kit.git
TPCDS_SRC_DIR   ?= target/tpcds-kit
TPCDS_TOOLS_DIR  = $(TPCDS_SRC_DIR)/tools
DSDGEN_BIN       = $(TPCDS_TOOLS_DIR)/dsdgen
DSQGEN_BIN       = $(TPCDS_TOOLS_DIR)/dsqgen
DSDGEN_JAR       = target/lib/dsdgen.jar

# Default goal
all: $(DSDGEN_JAR) target/hive-tpcds-setup-0.1-SNAPSHOT.jar

target/hive-tpcds-setup-0.1-SNAPSHOT.jar: $(shell find . -name '*.java')
	mvn package

# Clone once
$(TPCDS_SRC_DIR):
	@mkdir -p target
	git clone --depth 1 $(TPCDS_GIT_URL) $(TPCDS_SRC_DIR)

# Build dsdgen/dsqgen
$(DSDGEN_BIN): $(TPCDS_SRC_DIR)
	@command -v gcc >/dev/null || (sudo apt-get update -y && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y gcc make)
	$(MAKE) -C $(TPCDS_TOOLS_DIR) clean
	$(MAKE) -C $(TPCDS_TOOLS_DIR)

# Package a tiny jar with tools/ to match expected path
$(DSDGEN_JAR): $(DSDGEN_BIN)
	@mkdir -p target/lib
	cd $(TPCDS_SRC_DIR) && ( jar cvf ../lib/dsdgen.jar tools/ || gjar cvf ../lib/dsdgen.jar tools/ )

clean:
	mvn clean
	rm -rf $(TPCDS_SRC_DIR) $(DSDGEN_JAR)