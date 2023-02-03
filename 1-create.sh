#!/bin/bash
retrv1=$(btapi do vault/account/59/check-out)
retrv2=$(echo "$retrv1" | jq '.password')
retrv3=$(echo "$retrv1" | jq '.username')
tee vars.tf <<EOF
  variable REGION {
    default = "us-west-1"
  }
  
  variable a_key {
    default = $retrv3
  }

  variable s_key {
    default = $retrv2
  }
EOF
btapi do vault/account/59/check-in

# Run terraform provisioning
echo "rm -rf .terraform* `rm -rf .terraform*` `rm -f terraform*`"
terraform init
terraform apply -auto-approve

# Remove AWS IAM in vars
rm -f vars.tf
