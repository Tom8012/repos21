Perfect — let’s make this a **Terraform + Linux/Shell-focused 3-day refresh plan**, since most real-world Terraform usage happens via the terminal. You’ll reinforce not just Terraform itself, but also shell skills that help in DevOps/SRE roles.

---

## ✅ **3-Day Terraform + Shell Refresh Plan**

Each day is designed to build hands-on Terraform skill *plus* reinforce useful shell commands, scripting, and workflows.

---

### 🟩 **Day 1: Provision a Basic EC2 Instance via Shell**

#### ✅ Goal:

* Use Terraform CLI via Linux shell to create a basic EC2 instance.
* Reinforce CLI commands, config files, and instance lifecycle.

#### 🔧 Tasks:

**1. Create Project Folder**

```bash
mkdir terraform-ec2-demo && cd terraform-ec2-demo
```

**2. Create `main.tf`**

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    Name = "TerraformDemo"
  }
}
```

**3. Shell Workflow**

```bash
terraform init
terraform plan -out=tfplan.out
terraform apply tfplan.out
aws ec2 describe-instances --filters "Name=tag:Name,Values=TerraformDemo" \
  --query "Reservations[].Instances[].PublicIpAddress"
terraform destroy -auto-approve
```

#### 🔁 Shell Commands to Focus On:

* `grep`, `cat`, `less` – for inspecting state files
* `aws ec2 describe-instances` – basic AWS CLI usage
* `terraform plan > out.txt && tail -n 20 out.txt`

✅ *By end of Day 1, you're back in command-line flow + Terraform basics.*

---

### 🟨 **Day 2: Add Variables & Shell Scripts for Automation**

#### ✅ Goal:

* Add variables for flexibility.
* Use a shell script to run the workflow automatically.

#### 🔧 Tasks:

**1. Create `variables.tf`**

```hcl
variable "instance_type" {
  default = "t2.micro"
}
```

Update `main.tf`:

```hcl
instance_type = var.instance_type
```

**2. Create `run.sh`**

```bash
#!/bin/bash

set -e

echo "Initializing Terraform..."
terraform init

echo "Planning..."
terraform plan -var="instance_type=t3.micro" -out=tfplan.out

echo "Applying..."
terraform apply tfplan.out

echo "Fetching public IP..."
aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=TerraformDemo" \
  --query "Reservations[].Instances[].PublicIpAddress" --output text
```

**Make it executable:**

```bash
chmod +x run.sh && ./run.sh
```

✅ *You've now used automation to simplify repeatable deployment.*

---

### 🟦 **Day 3: Manage State + Add Outputs + Shell Logging**

#### ✅ Goal:

* Use outputs.
* Track logs from Terraform runs.
* Backup state files from shell.

**1. Add `outputs.tf`**

```hcl
output "public_ip" {
  value = aws_instance.demo.public_ip
}
```

**2. Run with log capture**

```bash
terraform apply -auto-approve | tee apply.log
```

**3. Backup state**

```bash
mkdir -p backups
cp terraform.tfstate backups/terraform.tfstate.bak.$(date +%s)
```

**4. Destroy**

```bash
terraform destroy -auto-approve | tee destroy.log
```

✅ *You've reinforced shell automation, logging, and basic backup practices.*

---

## 📦 Bonus GitHub Project Structure

```bash
terraform-ec2-demo/
├── main.tf
├── variables.tf
├── outputs.tf
├── run.sh
├── apply.log
├── destroy.log
└── backups/
```

Push this to GitHub with a `README.md`:

> *"This project uses Terraform and shell scripting to deploy and manage a basic AWS EC2 instance, including automation, logging, and state backup."*

---

Would you like me to generate the full contents of `run.sh`, `README.md`, or `.tf` files for you now?
