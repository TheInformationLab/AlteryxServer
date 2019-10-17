# Packer: Documentation Steps
================================

This documentation is here to assist you with populating the information required to run the Packer binary for creating a default based image for use with Server.


#### Variables file (variables.json)
|Name  |Type  |Default|Description|
|------|------|-------|-----------|
|name|String|`Windows_2016_Server`|This value represents the name of the Default image for Server.|
|profile|String|`customer-success`|If you have a profile setup for you account then populate that value here. If not, please delete this value.|
|region|String|`us-west-2`|This value represents the region you use by default.|
|source_ami|String|`ami-06a0d33fc8d328de0`|This value represents the source Windows AMI for Server in the West 2 region (This value needs to be constantly updated.)|
|instance|String|`m4.xlarge`|This value is the default minimum instance type to use for Server.|
|password|String|`SuperS3cr3t!1`|This value represents a default passowrd for use with your AMI while it's being built. (Please update this password!)|
