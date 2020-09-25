# Docker

## Mount a gem as a volume in Compose

- Find out the directory of the gem in the container: `bundle show <gem-name>`
- Add the following to the compose file (`docker-compose.yml` by default).

```yml
...
volumes
  - <path-to-local-gem>:<output-of-command-above>:ro
```

- Restart the container, to mount the volume.
