DIST_DIR=dist

all: clean dist download zip

zip:
	tar czf openproject.tar.gz . -C $(DIST_DIR)

download: 
	mkdir -p $(DIST_DIR)/packages/amd64
	cd $(DIST_DIR)/packages/amd64 && apt-get download dialog libevent-core-2.0-5 libevent-extra-2.0-5 openproject

dist: 
	mkdir -p $(DIST_DIR)/metadata
	cp openproject.ini $(DIST_DIR)/metadata/
	cp openproject.inst $(DIST_DIR)/metadata/
	cp openproject.uinst $(DIST_DIR)/metadata/
	cp openproject.svg $(DIST_DIR)/metadata/
	cp openproject.readme $(DIST_DIR)/

clean:
	rm -rf $(DIST_DIR)
	rm -f openproject.tar.gz
