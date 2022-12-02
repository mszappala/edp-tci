

!#!/bin/bash

install(){

	#instalamos servicio y timer

	SYNC_PATH=$(PWD)/sync/symc.txt

	sed "s|\#REPLACEME|$SYNC_PATH|".services/tp_edp.template>services/tp_edp.service
	sudo cp services/tp_edp.service/etc/systemd/system
	sudo cp services/tp_edp.timer/etc/systemd/system
	sudo systemctl daemon-reload
	sudo sustemctl start tp_edp.timer

	#aqui levantamos los dockers

	docker-compose up -d --build

	}

install



