# WebPortfolio
My personal portfolio website hosted in AWS


## Enviroment setup

### AWS
   - Set up an AWS account, here the AWS instruction: https://docs.aws.amazon.com/SetUp/latest/UserGuide/setup-prereqs-instructions.html
   - Instal AWS CLI from: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
   - create an IAM user and set the credential into your AWS CLI client: https://docs.aws.amazon.com/cli/latest/userguide/cli-authentication-user.html

``` 
aws configure
AWS Access Key ID [None]: <IAM_User_Key_ID>
AWS Secret Access Key [None]: <IAM_User_Key>
Default region name [None]: eu-centrel-1
Default output format [None]: json
```

### Terraform
   - Download the Terraform client for system: https://developer.hashicorp.com/terraform/install?product_intent=terraform
   - Configure the client to executable in the cli. On Windows, you will need to set the terraform client folder in the system `path` variable



## Project Deployment
   - in your system cli enter the project folder
   - initialize the project terraform config by running this command: `terraform init`
   - [optional] to preview what will be deployed in AWS run this command: `terraform plan`
   - deploy the project to AWS by running this command: `terraform apply`
   - say `yes` whet prompted to confirm the deployment
   - the deployment may take 3 to 5 minutes to finish
   - the url for the webportfolio page will be shown at the end of the deployment in the `Outputs:` section as the value of `webportfolio_domain_name` 

## Removing the project from AWS
   - in your system cli enter the project folder
   - [optional] to preview what will be deployed in AWS run this command: `terraform plan -destroy`
   - deploy the project to AWS by running this command: `terraform apply -destroy`
   - say `yes` whet prompted to confirm the removal
   - the removal may take 3 to 5 minutes to finish