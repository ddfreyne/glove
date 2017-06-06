.PHONY: default
default: spec

.PHONY: deps
deps: lib

lib: shard.yml
	@echo "*** Installing dependencies…"
	crystal deps
	mkdir -p `dirname $@`
	touch $@
	@echo

.PHONY: ext
ext:
	@echo "*** Building ext…"
	make -C src/ext
	@echo

.PHONY: doc
doc:
	@echo "*** Building documentation…"
	crystal docs
	mv doc docs
	@echo

.PHONY: spec
spec: deps ext
	@echo "*** Testing…"
	crystal spec
	@echo
