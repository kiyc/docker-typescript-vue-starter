FROM node:lts-alpine

ENV NODE_ENV=development

RUN apk update && \
  apk add openrc nginx vim && \
  sed -i'.bak' 's/^#rc_sys=""/rc_sys="lxc"/' /etc/rc.conf && \
  sed -i 's/^#rc_provide="!net"/rc_provide="loopback net"/' /etc/rc.conf && \
  sed -i'.bak' '/getty/d' /etc/inittab && \
  sed -i'.bak' 's/mount -t tmpfs/# mount -t tmpfs/' /lib/rc/sh/init.sh && \
  sed -i'.bak' 's/hostname $opts/# hostname $opts/' /etc/init.d/hostname && \
  sed -i'.bak' 's/cgroup_add_service$/# cgroup_add_service/' /lib/rc/sh/openrc-run.sh && \
  mkdir /run/openrc && \
  touch /run/openrc/softlevel && \
  sed -i'.bak' 's/return 404;/root \/ts-vue;\n\t\tindex index.html;/' /etc/nginx/conf.d/default.conf && \
  rc-status && \
  rc-service nginx checkconfig && \
  mkdir /ts-vue && \
  cd /ts-vue && \
  mkdir dist && \
  mkdir -p src/components && \
  npm init -y && \
  npm install --save-dev typescript webpack webpack-cli ts-loader css-loader vue vue-loader vue-template-compiler

COPY src/index.ts /ts-vue/src/
COPY index.html package.json tsconfig.json webpack.config.js /ts-vue/
COPY init.sh /

EXPOSE 80

CMD /bin/ash init.sh
