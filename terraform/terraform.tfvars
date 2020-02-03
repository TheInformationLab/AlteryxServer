# Do not change the variabe below... Change only if you really want too...
ALLACCESSIPS = [
    "0.0.0.0/0"
]
# Change these IP's for your Private environment
ALLOWEDIPS = [
    ""
]

# Add your AWS Access Key
# This is applied as part of the Cloud environment variables
# AWS_ACCESS_KEY = ""

# This is the minimum System Requirements for the AWS Instance type
AWS_INSTANCE = "m5.xlarge"

# Add your AWS Secret Key here
# This is applied as part of the Cloud environment variables
# AWS_SECRET_KEY = ""

# Needs to match an existing SSH Key name in your AWS account (No Need for .pem extension)
# TODO: Change to generate new key for new instances
KEY_NAME = ""

# Path to the PEM key on your local machine
# TODO: Change to generate new key for new instances
KEY_PATH = ""

# Private CIDR block for the Promote instances (Change as you see fit)
PRIVATE_CIDRS = ""

# Minimum System Requirement for the Volume (100 gb) (Change as you see fit with a higher Volume size)
VOLUME_SIZE = ""

# VPC CIDR (Change as you see fit)
VPC_CIDR = ""