# Pre-Requisites

- AWS account
- AWS CLI with credentails for creating required resources

- Create a Security group with below inbound rules for instance for which we will be getting the metadata in the default vpc
	```
	22 from your IP
	80 from anywhere
	```

> [!WARNING]
> Change the security group, Image and region according to your use case

- Open the cloud shell and run the below command
    ```
    aws ec2 run-instances \
	--image-id ami-089ffe32605122764 \
	--count 1 \
	--instance-type t2.micro \
	--security-group-ids sg-0aca51b53876e08a5 \
	--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=test-instance}]' \
	--region us-west-2
    ```

- Wait for the EC2 to get 2/2 status check and use Instance connect to login to the instance

- Copy the contents from ```ec2-all-metadata.sh``` and ```ec2-specific-metadata.sh``` into seperate files inside the ec2 instance

- modify the permissions to make the file executable
    ```
    chmod +x <file-name>
    ```

- Run the below command to disable in v2 metadata service
    ```
    aws ec2 modify-instance-metadata-options \
    --instance-id <instance-id> \
    --http-tokens optional \
    --http-endpoint enabled
    ```

- Run the shell script inside the instance
    ```
    ./ec2-all-metadata.sh
    ./ec2-specific-metadata.sh <instance-id>
    ```