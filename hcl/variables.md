# Call

```hcl
   var.name
"${var.name}"
```

# Define

blocks in _*.tf_ for terraform and _*.pkr.hcl_ for packer:

```hcl
variable "name" {
    description = "..."
    type        = string
    default     = "..."
}
```

# Assign (or use `default = ...` in the definition):

## auto load _key = value_ files:

### terraform
- `terraform.tfvars`
- *.`auto.tfvars`

### packer
- *.`auto.pkrvars.hcl`
