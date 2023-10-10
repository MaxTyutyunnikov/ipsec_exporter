.DEFAULT_GOAL:=help
.PHONY: all help clean release major minor patch
.PRECIOUS:
SHELL:=/bin/bash

VERSION:=$(shell git describe --abbrev=0 --tags)
CURRENT_BRANCH:=$(shell git rev-parse --abbrev-ref HEAD)

help:
	@echo -e "\033[33mUsage:\033[0m\n  make TARGET\n\n\033[33mTargets:\033[0m"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-7s\033[0m %s\n", $$1, $$2}'

git_commit:
	@git add .
	@git commit -a -m "Auto" || true

git_push: git_commit
	@git push --all
	@git push --tags

build:
	go build -o ipsec_exporter ./cmd/ipsec_exporter

bootstrap:
	git remote add altbrace https://github.com/altbrace/ipsec_exporter.git
	git remote add dioss-Machiel https://github.com/dioss-Machiel/ipsec_exporter.git
	git remote add ffreville https://github.com/ffreville/ipsec_exporter.git
	git remote add HabitatEnergy https://github.com/HabitatEnergy/ipsec_exporter.git
	git remote add idatahu https://github.com/idatahu/ipsec_exporter.git
	git remote add ivanu-bede https://github.com/ivanu-bede/ipsec_exporter.git
	git remote add oxyno-zeta https://github.com/oxyno-zeta/ipsec_exporter.git
	git remote add spheromak https://github.com/spheromak/ipsec_exporter.git
	git pull --all

worktree:
	git worktree add ../ipsec_exporter.altbrace; cd ../ipsec_exporter.altbrace; git checkout altbrace/main || :
	git worktree add ../ipsec_exporter.dioss-Machiel; cd ../ipsec_exporter.dioss-Machiel; git checkout dioss-Machiel/main || :
	git worktree add ../ipsec_exporter.ffreville; cd ../ipsec_exporter.ffreville; git checkout ffreville/main || :
	git worktree add ../ipsec_exporter.HabitatEnergy; cd ../ipsec_exporter.HabitatEnergy; git checkout HabitatEnergy/main || :
	git worktree add ../ipsec_exporter.idatahu; cd ../ipsec_exporter.idatahu; git checkout idatahu/main || :
	git worktree add ../ipsec_exporter.ivanu-bede; cd ../ipsec_exporter.ivanu-bede; git checkout ivanu-bede/main || :
	git worktree add ../ipsec_exporter.oxyno-zeta; cd ../ipsec_exporter.oxyno-zeta; git checkout oxyno-zeta/main || :
	git worktree add ../ipsec_exporter.spheromak; cd ../ipsec_exporter.spheromak; git checkout spheromak/main || :
