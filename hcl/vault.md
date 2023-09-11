# Secrets

A *kv* secret is a *dict* of key/value pairs

```
[/namespace/]engine(e.g kv)/secret
  field1: val1
  field2: val2
```

## list

```
vault secrets list
vault      kv list GitLab
```

## put vs patch

`vault kv patch` creates a new version same as `vault kv put`,
the difference is it merges the new _K#V_ pairs with the existing ones

# PKI

```bash
vault path-help pki # show supported API

# Certs
vault kv list xxx/certs # read doesn't work for that
vault kv get -field=... xxx/cert/ca | openssl x509 -noout -subject -issuer -dates # kv can be used instead of read
vault kv get -field=... xxx/cert/00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00

vault read xxx/config/urls # crl

# Roles
vault list xxx/roles
vault read xxx/roles/my_role
vault kv get -field=allowed_domains xxx/roles/my_role | tr '[] ' '\r\n'

vault write xxx/issue/gitlab_https common_name=... # issue new cert
vault write xxx/intermediate/generate/internal common_name="myvault.com Intermediate Authority" ttl=43800h # generate CSR
```
