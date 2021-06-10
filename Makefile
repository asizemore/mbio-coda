base_dir :=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
pwd = $(shell pwd)
local_name = eda-coda
tag ?= dev
# run_cmd ?= jupyter notebook

.PHONY: build
build:
	@echo Building $(local_name):$(tag)
	@docker build -t $(local_name):$(tag) .

run:
	@docker run -d -p 8789:8787 -e PASSWORD=mypass -v $(pwd):/home/rstudio/Documents rstudio:dev
# 	@open http://localhost:8081
# 	@docker run -p 8081:8888 --rm -it $(local_name):$(tag) $(run_cmd)

stop:
	@docker stop shiny-dev