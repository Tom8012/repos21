Great! Below is the complete set of files for your **Terraform + Shell EC2 demo project**, ready to run and upload to GitHub if you'd like.

---

## 📁 `terraform-ec2-demo` Project Structure

```
terraform-ec2-demo/
├── main.tf
├── variables.tf
├── outputs.tf
├── run.sh
├── apply.log              # (Generated after running script)
├── destroy.log            # (Generated after destroy)
└── backups/               # For state file backups
```

---

## 📄 `main.tf`

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 AMI
  instance_type = var.instance_type

  tags = {
    Name = "TerraformDemo"
  }
}
```

---

## 📄 `variables.tf`

```hcl
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}
```

---

## 📄 `outputs.tf`

```hcl
output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.demo.public_ip
}
```

---

## 📄 `run.sh` (Automation Script)

```bash
#!/bin/bash

set -e  # Stop if any command fails

echo "🌱 Initializing Terraform..."
terraform init

echo "📋 Planning infrastructure..."
terraform plan -var="instance_type=t3.micro" -out=tfplan.out

echo "🚀 Applying plan..."
terraform apply tfplan.out | tee apply.log

echo "🌐 Fetching public IP..."
PUBLIC_IP=$(terraform output -raw public_ip)
echo "Public IP: $PUBLIC_IP"

echo "💾 Backing up state file..."
mkdir -p backups
cp terraform.tfstate backups/terraform.tfstate.bak.$(date +%s)

read -p "🧨 Do you want to destroy the instance now? (y/n): " choice
if [[ "$choice" == "y" ]]; then
    echo "Destroying infrastructure..."
    terraform destroy -auto-approve | tee destroy.log
else
    echo "Instance retained. You can destroy later with:"
    echo "terraform destroy -auto-approve"
fi
```

Make it executable:

```bash
chmod +x run.sh
```

---

## 📄 `README.md` (for GitHub)

````markdown
# Terraform EC2 Demo with Shell Automation

This project demonstrates how to use **Terraform** and **shell scripting** to:
- Provision a basic EC2 instance on AWS
- Use variables and outputs
- Automate workflows with shell
- Log outputs and backup state files

## 🛠️ Requirements
- Terraform CLI
- AWS CLI configured (`aws configure`)
- Bash shell

## 🚀 Usage

```bash
./run.sh
````

The script will:

* Initialize Terraform
* Plan and apply infrastructure
* Print the EC2 public IP
* Backup the state file
* Optionally destroy the instance

## 📁 Project Structure

```
main.tf          # Terraform config
variables.tf     # Instance type variable
outputs.tf       # Outputs public IP
run.sh           # Automation script
backups/         # State backups
apply.log        # Log of apply
destroy.log      # Log of destroy
```

## 🔐 Notes

* Make sure your AWS account has permissions to launch EC2.
* The instance type is configurable in the script (`t3.micro` used by default).

## ✅ Example Output

```bash
Public IP: 3.92.120.111
```

## 🧹 Cleanup

To manually destroy the infrastructure:

```bash
terraform destroy -auto-approve
```

```

---

Would you like me to zip this project structure and help you upload to GitHub? Or walk you through running it locally?
```
