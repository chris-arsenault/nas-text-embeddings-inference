.PHONY: ci compose-config required-files

ci: compose-config required-files

compose-config:
	docker compose --env-file .env.example -f compose.yaml config >/tmp/nas-text-embeddings-inference-compose.yaml

required-files:
	test -f compose.yaml
	test -f .env.example
	test -f secret-paths.yml
	test -f platform.yml
