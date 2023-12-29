.PHONY: install
install:
	./install

.PHONY: git-update
git-update:
	git pull

.PHONY: update
update: git-update install
