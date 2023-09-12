DCMP = docker-compose
APP = app
DCMP_EXEC_APP = ${DCMP} exec ${APP}
DCMP_RUN_APP = ${DCMP} run --rm ${APP}

up:
	${DCMP} up
upd:
	${DCMP} up -d
down:
	${DCMP} down
bash:
	${DCMP_RUN_APP} bash
rebuild:
	${DCMP} build
dbcreate:
	${DCMP_RUN_APP} bundle exec rails db:create  