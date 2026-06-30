# nas-text-embeddings-inference

Komodo-managed text embeddings inference stack for Ahara services running on
TrueNAS.

## Scope

- This repo owns the TrueNAS Docker Compose configuration for Hugging Face Text Embeddings Inference.
- Do not add project-owned wrapper images unless the upstream image cannot be configured safely.
- Runtime deployment uses Ahara's shared TrueNAS/Komodo workflow with `truenas_images: false`.
- Secrets are referenced by SSM path in `secret-paths.yml`; never commit secret values.
- Run `make ci` before handoff after changing files.

## Stack

- Hugging Face Text Embeddings Inference CPU image.
- Model: `nomic-ai/nomic-embed-text-v1.5`.
- HTTP endpoint on port `5361`.

## Platform Boundaries

- Keep Komodo Compose/configuration in this repo.
- Keep AWS reverse proxy routes, DNS, SSM parameters, and database registration in `ahara-infra`.
- Keep shared workflow and deployment guidance in `ahara`.
