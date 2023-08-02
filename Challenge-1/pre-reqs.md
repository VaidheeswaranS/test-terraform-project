# Pre-Requisites for all Challenges

AWS account
AWS CLI with credentails for creating required resources

# pre-reqs for Challenge-1

- Create a Security group with below inbound rules for jenkins instance in the default vpc
	22 from your IP
	80 from anywhere
	8080 from anywhere

- IAM role for Jenkins instance with right persmissions

- Open the cloudshell and copy the contents from ```user-data.sh``` and save the file

- Create a EC2 instance for Jenkins from the cloudshell (once the above three steps are completed)
	```
	aws ec2 run-instances \
	> --image-id ami-089ffe32605122764 \
	> --count 1 \
	> --instance-type t2.micro \
	> --security-group-ids sg-0aca51b53876e08a5 \
	> --iam-instance-profile Name=EC2JenkinsAdminRole \
	> --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=jenkins-instance}]' \
	> --user-data file://script.sh \
	> --region us-west-2
	```
- Create a S3 bucket to store the terraform state file
	```
	aws s3api create-bucket --bucket terraform-remote-state-12354 --create-bucket-configuration LocationConstraint=us-west-2
	```

- Wait for the EC2 to get 2/2 status check and then hit the below endpoint
	```
	public-ip:8080
	```

- Configure the Jenkins with default values

- Please add the plugin ```Terraform``` and restart the Jenkins service

- Add terraform tool in global tool configuration (specify the installation path for terraform and uncheck Install automatically)
