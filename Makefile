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
	${DCMP_RUN_APP} bundle exec rails db:drop
dbcreate:
	${DCMP_RUN_APP} bundle exec rails db:create
dbmigrate:
	${DCMP_RUN_APP} bundle exec rails db:migrate
console:
	${DCMP_RUN_APP} bundle exec rails console
buildcss:
	${DCMP_RUN_APP} yarn build:css
buildjs:
	${DCMP_EXEC_APP} yarn build
