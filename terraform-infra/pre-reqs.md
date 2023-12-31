# Pre-Requisites

- AWS account
- AWS CLI with credentails for creating required resources (if you are planning to create resources other than using cloudshell)

> [!NOTE]
> I have used us-west-2 (Oregon) for performing all the activities

> [!WARNING]
> Please change the region appropriately if you are using other than us-west-2

- Create a Security group with below inbound rules for jenkins instance in the default vpc
	```
	22 from your IP
	80 from anywhere
	8080 from anywhere
	```

- IAM role for Jenkins instance with right persmissions

- Open the cloudshell and copy the contents from ```user-data.sh``` and save the file

- Create a EC2 instance for Jenkins from the cloudshell (once the above three steps are completed)

> [!WARNING]
> Change the security group, Image, IAM role and region according to your use case

- Use the below command to provision the Jenkins instance
	```
	aws ec2 run-instances \
	--image-id ami-089ffe32605122764 \
	--count 1 \
	--instance-type t2.medium \
	--security-group-ids sg-0aca51b53876e08a5 \
	--iam-instance-profile Name=EC2JenkinsAdminRole \
	--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=jenkins-instance}]' \
	--user-data file://script.sh \
	--region us-west-2
	```
- Create a S3 bucket and enable versioning for the s3 bucket to store the terraform state file from the cloudshell
	```
	aws s3api create-bucket --bucket terraform-remote-state-12354 --create-bucket-configuration LocationConstraint=us-west-2

	aws s3api put-bucket-versioning --bucket terraform-remote-state-12354 --versioning-configuration Status=Enabled
	```

- Wait for the EC2 to get 2/2 status check and then hit the below endpoint
	```
	http://public-ip:8080
	```

- Configure the Jenkins with default values (Use EC2 Instance connect to login to instance to get the initial admin password and to check logs and restart services)

- Please add the plugin ```Terraform``` and restart the Jenkins service

- Add terraform tool in global tool configuration (specify the installation path for terraform and uncheck "Install automatically" option)

# Challenge-1 Implementation

- Go to your Jenkins endpoint
	```
	http://<public-ip>:8080
	```
- Create a pipeline project (use pipeline from SCM and add the gihub details) and use the Jenkinsfile provided under ```terraform-infra/pipeline/Jenkinsfile``` in script path

- Run the job and abort the first build once it starts (to refresh the job parameters)

- Now run the job with the parameters and please create the resources in the following order
	```
	vpc
	alb-web
	ec2-web
	register the web instance as targets for web alb once 2/2 status check completed (using console)
	alb-app
	ec2-app
	register the app instance as targets for app alb once 2/2 status check completed (using console)
	rds
	```

- Once all resources are created and if you want destroy all the resources please do it in the following order
	```
	rds
	ec2-app
	alb-app
	ec2-web
	alb-web
	vpc
	```

