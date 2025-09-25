all: target/lib/dsdgen.jar target/hive-tpcds-setup-0.1-SNAPSHOT.jar

target/hive-tpcds-setup-0.1-SNAPSHOT.jar: $(shell find . -name *.java)
	mvn package

target/tpcds_kit.zip: tpcds_kit.zip
	mkdir -p target/
	cp tpcds_kit.zip target/tpcds_kit.zip

tpcds_kit.zip:
	wget https://github.com/alexthomasv/hdfs-3.3.3/releases/download/flink/tpcds-kit.zip -O tpcds_kit.zip

target/lib/dsdgen.jar: target/tools/dsdgen
	cd target/; mkdir -p lib/; ( jar cvf lib/dsdgen.jar tools/ || gjar cvf lib/dsdgen.jar tools/ )

target/tools/dsdgen: target/tpcds_kit.zip
	# unpack once (safe to re-run)
	test -d target/tools/ || (cd target; unzip -oq tpcds_kit.zip)
	test -d target/tools/ || (cd target; mv */tools tools)

	# apply common patches idempotently
	@cd target/tools && \
	for p in ../../patches/all/*.patch; do \
		[ -e "$$p" ] || continue; \
		patch -p0 -N --batch < "$$p" || true; \
	done

	# apply OS-specific patches idempotently
	@cd target/tools && \
	for p in ../../patches/$(MYOS)/*.patch; do \
		[ -e "$$p" ] || continue; \
		patch -p1 -N --batch < "$$p" || true; \
	done

	cd target/tools; make clean; make dsdgen

clean:
	mvn clean