# MegaPut Docker

A Docker image and scripts to automate uploading files from a local directory to a MEGA cloud
account using [MEGAcmd](https://mega.nz/cmd).

## Features

- Upload all files from a specified local directory to a remote MEGA folder.
- Easily configurable via environment variables.
- Multi-platform build scripts (Linux amd64/arm64, Windows).
- Simple integration with CI/CD pipelines or automation workflows.

## Usage

### 1. Build the Docker Image

#### For Linux (amd64)

```sh
cd src
bash docker-build-amd64.sh
```

#### For Linux (arm64)

```sh
cd src
bash docker-build-arm64.sh
```

#### For Windows (amd64)

```bat
cd src
docker-build-amd64.bat
```

### 2. Run the Container

```sh
docker run --rm \
  -e MEGA_USERNAME=your_mega_email \
  -e MEGA_PASSWORD=your_mega_password \
  -e REMOTE_PATH=/Root/your/remote/path \
  -v /path/to/local/queue:/queue \
  mfedatto/megaput:amd64
```

- Replace `/path/to/local/queue` with your local directory containing files to upload.
- Set `REMOTE_PATH` to your desired MEGA folder path.

### Environment Variables

| Variable      | Description                    | Default   |
| ------------- | ------------------------------ | --------- |
| MEGA_USERNAME | Your MEGA account email        | (none)    |
| MEGA_PASSWORD | Your MEGA account password     | (none)    |
| QUEUE_PATH    | Local directory to upload from | `/queue`  |
| REMOTE_PATH   | Remote MEGA path to upload to  | `/`       |

## How It Works

- The container starts and runs `entrypoint.sh`.
- If the directory specified by `QUEUE_PATH` contains files, it logs into MEGA and uploads all files
to `REMOTE_PATH` using `mega-put`.
- If the directory is empty or does not exist, it prints a message and exits.

## File Structure

- `Dockerfile`: Docker image definition.
- `entrypoint.sh`: Entrypoint script for uploading files.
- Build scripts for different platforms:
  - `docker-build-amd64.sh`
  - `docker-build-arm64.sh`
  - `docker-build-platform.sh`
  - `docker-build-amd64.bat`
  - `docker-build-platform.bat`

## License

[MIT License](./LICENSE)

---

**Author:** [mfedatto](https://github.com/mfedatto)
