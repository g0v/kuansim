pgrest:
  dev: true
postgresql:
  enable_pgdg_apt: true
  version: "9.2"
  config:
    ssl: false
  client:
    packages:
      "postgresql-client-9.2"
      "postgresql-contrib-9.2"
      "libpq-dev"
  server:
    packages:
      "postgresql-9.2"
      "postgresql-server-dev-9.2"
  pg_hba: 
    * type: "local"
      db: "all"
      user: "postgres"
      addr: null
      method: "password"
    * type: "local"
      db: "all"
      user: "postgres"
      addr: null
      method: "ident"
    * type: "local"
      db: "all"
      user: "kuansim"
      addr: null
      method: "password"
    * type: "host"
      db: "all"
      user: "all"
      addr: "127.0.0.1/32"
      method: "trust"
    * type: "host"
      db: "all"
      user: "all"
      addr: "::1/128"
      method: "md5"
  password:
    postgres: "hackg0v"