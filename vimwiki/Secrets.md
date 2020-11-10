# Secrets

Secrets can be mounted as volumes or added to the environment of the Pod. See
the Kubernetes docs for how.

## Creating a secret.

The Kubernetes docs online cover this fully, here is a sample snippet.

`kubectl --namespace=accounts create secret generic shibboleth-sp-staging-shibboleth-sp --from-file=./sp-encrypt-key.pem --from-file=./sp-signing-key.pem`

## Editing a secret 

You can edit a secret, it'll open up in Vim for you to changes the values.
However, they're all in base64.

`ksa get secret shibboleth-sp-staging-shibboleth-sp -o yaml`

## Base64

Secrets are stored as base64'd values.

How to do that via command line.

```
pq@pq:~/.bashfiles$ echo -n "test" | base64
dGVzdA==
pq@pq:~/.bashfiles$ echo -n "dGVzdA==" | base64 -d
test
```

The `-n` flag for `echo` is important, it prevents a Line Feed character (`\n`)
from being add to stdout by `echo`.
