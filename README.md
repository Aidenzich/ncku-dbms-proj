# DBMS Final Project
## Quick Start
```bash
yarn create directus-project [project-name]
cd [project-name]
npx directus start
```

### Run with Docker
```
docker compose up -d
```


## Reference
1. https://stackoverflow.com/questions/72380698/how-to-create-and-deploy-an-endpoint-with-directus
2. https://github.com/directus/directus/discussions/3312


## Dump data
docker exec -it fd9f36dc8b2e pg_dump -U postgres directus > backup