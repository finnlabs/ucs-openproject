SHELL := /bin/bash
DIST_DIR=dist

all: clean download zip

zip:
	tar czf openproject.tar.gz -C $(DIST_DIR) .

download: 
	mkdir -p $(DIST_DIR)/packages/amd64
	cd $(DIST_DIR)/packages/amd64 && apt-get download dialog libevent-core-2.0-5 libevent-extra-2.0-5 openproject

clean:
	for file in $(DIST_DIR)/openproject_20*; do ( [ -f "$$file" ] && mv "$$file" "$${file/_*./.}" || true ); done 
	rm -f $(DIST_DIR)/packages/amd64/*
	rm -f openproject.tar.gz
