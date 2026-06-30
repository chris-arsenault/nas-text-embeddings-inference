# nas-text-embeddings-inference

Komodo-managed Hugging Face Text Embeddings Inference stack for TrueNAS.

This repo manages upstream-image configuration only. It does not build or push
project-owned images; Ahara CI validates the Compose file and asks Komodo to
deploy the upstream CPU image.

## Service

| Service | Purpose | TrueNAS Port |
| --- | --- | --- |
| Text Embeddings Inference | HTTP embeddings endpoint | `192.168.66.3:5361` |

## Model

The deployed model is:

```text
nomic-ai/nomic-embed-text-v1.5
```

The model cache is stored on the TrueNAS host at:

```text
/mnt/apps/apps/nas-text-embeddings-inference/model-cache
```

## Local Checks

```bash
make ci
```

The check validates `compose.yaml` with `.env.example` and verifies required
platform files exist.

## Deployment

`platform.yml` declares this as a vendor TrueNAS stack:

```text
stack: [vendor]
truenas: true
truenas_images: false
```

Komodo deploys `compose.yaml` directly from this repository. AWS-facing
networking such as reverse proxy routes or DNS belongs in `ahara-infra`.
