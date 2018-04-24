# Setup
Set these variables:
- `export do_token=ABC123`
- `export cloudflare_email=email@example.com`
- `export cloudflare_token=ABC132`

# Running
Run terraform with these optins
```
terraform \
  -var="do_token=${do_token}" \
  -var="cloudflare_email=${cloudflare_email}" \
  -var="cloudflare_token=${cloudflare_token}" \
  apply
```
