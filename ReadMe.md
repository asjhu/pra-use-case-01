### BeyondTrust Prvilege Remote Access (PRA)
#### Ephimeral Jump Items for AWS Auto scaling or other dynamic services
#### This How-To is work in progress...

#### Pre-reqsuisites: Linux host, PRA btapi, terraform, AWS, Jumpoint running in a VPC and Security Groups configured, SSH keys created both in AWS and PRA, AWS IAM with EC-2 Full access role and IAM keys are vaulted in PRA.
#### Create a file called 4-jump-item-create.sh (this file is referenced in line 24 of 3-pra-aws.tf) then copy paste the script contents of "Deploy the Instances in EC2" (https://www.beyondtrust.com/docs/privileged-remote-access/how-to/integrations/api/use-cases.htm). Replace values with your PRA instance:
```sh
BT_CLIENT_ID=XXX
BT_CLIENT_SECRET=XXX
BT_API_HOST=XXX
#### The Jump Group and Jumpoint to use for the Jump Item
JUMP_GROUP_ID=x
JUMPOINT_ID=x
```
####  Store PRA credentials as Environment Variables in your linux host. Replace XXX with corresponding values. Appending .bashrc
```sh
echo -e "export BT_CLIENT_ID=XXX \nexport BT_CLIENT_SECRET=XXX \nexport BT_API_HOST=XXX" >> ~/.bashrc
source ~/.bashrc
```

#### Execute 1-create.sh to create EC2 hosts and Jump items
#### Execute 2-destroy.sh to delete EC2 hosts

### Missing intructions to auto delete Jump items in PRA  (ToDo)
