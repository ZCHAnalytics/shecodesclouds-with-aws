## OPTIONAL MODS:
- Developer Mods
- DevOps Mods
- Security Mods
- Solution Architect Mods
- Data Engineer Mods
- AI ENgineer Mods 


1. AWS Account 

- create an AWS root account|  V||
- create an organization/single accoutn mode instance 
- create an AWS account SecureOps and user resume-secops 
- create an AWS IAM identity Centre user ruser.dev
add permission  sets, AdministratorAccess , 2 hours log session
- in IAM identity Centerte > AWS Accounts > Select currect acount > Assign user resume.admin.dev 
> submit 

| create abstraction lawyer| n account instance |  AWS organization | 
| create an IAM user `cloudresume` with MFA || 

username: admin.resume.dev
`aws sts get-caller-identity --profile cli-dev`
$ aws sts get-caller-identity --profile cli-dev
{
    "UserId": "AROAYIZC646O7LUQ5P2CU:resume.admin.dev",
    "Account": "568619624349",
    "Arn": "arn:aws:sts::568619624349:assumed-role/AWSReservedSSO_AdministratorAccess_05f700ce5858777b/resume.admin.dev"     
}a
``aws configure set profile.cli-dev.region eu-west-2

# Create a bucket for tfstate
$ aws s3api create-bucket --bucket zch-tfstate-bucket --region eu-west-2 --create-bucket-configuration LocationConstraint=eu-west-2 --profile cli-dev

# Create a DynamoDB Table for tf state
aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region eu-west-2 \
  --profile cli-dev
  


- instal aws toolkit extension V
`pip install awscli` 
- upgrade to AWS CLI v2 

`aws configure sso``


- set up configuration files on local machine 
`python -m venv resume_venv`
`source resume_venv/scripts/activate`
