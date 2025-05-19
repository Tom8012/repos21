✅ Summary Table
Feature	Syntax Example
Declare	var="value"
Use	echo "$var"
Arithmetic	sum=$((a + b))
Loop	for var in ...; do ...; done
Condition	if [ $var -eq 5 ]; then ...; fi
Function	my_func() { ... }


 Here are several **shell script examples** commonly used in **DevOps workflows**, categorized by task. These scripts are useful for automation, system monitoring, deployment, and CI/CD pipelines.

---

### 🔧 1. **System Update and Package Installation**

```bash
#!/bin/bash
# Update system and install packages

echo "Updating system..."
sudo apt-get update -y && sudo apt-get upgrade -y

echo "Installing essential packages..."
sudo apt-get install -y git curl vim unzip
```

---

### 🧹 2. **Log Cleanup Script**

```bash
#!/bin/bash
# Clean logs older than 7 days

LOG_DIR="/var/log/myapp"
find "$LOG_DIR" -type f -name "*.log" -mtime +7 -exec rm -f {} \;

echo "Old logs deleted from $LOG_DIR"
```

---

### 🧪 3. **CI Build and Test Script**

```bash
#!/bin/bash
# CI pipeline step: build and test

echo "Cloning repository..."
git clone https://github.com/your-org/your-repo.git
cd your-repo || exit 1

echo "Running tests..."
./run_tests.sh

if [ $? -eq 0 ]; then
  echo "Tests passed. Building project..."
  ./build.sh
else
  echo "Tests failed. Exiting."
  exit 1
fi
```

---

### 🚀 4. **Deployment Script**

```bash
#!/bin/bash
# Deploy application to staging

APP_DIR="/var/www/staging"
REPO_URL="git@github.com:your-org/your-repo.git"

echo "Deploying app to staging..."

cd "$APP_DIR" || exit
git pull origin main
./restart.sh

echo "Deployment completed."
```

---

### ☁️ 5. **AWS EC2 Instance Health Check**

```bash
#!/bin/bash
# Check health of an EC2 instance

INSTANCE_ID="i-1234567890abcdef0"
REGION="us-east-1"

STATUS=$(aws ec2 describe-instance-status --instance-ids "$INSTANCE_ID" --region "$REGION" --query "InstanceStatuses[0].InstanceStatus.Status" --output text)

echo "Instance $INSTANCE_ID status: $STATUS"
```

---

### 🔐 6. **SSL Certificate Expiry Check**

```bash
#!/bin/bash
# Check SSL expiry for a domain

DOMAIN="example.com"

expiry_date=$(echo | openssl s_client -servername $DOMAIN -connect $DOMAIN:443 2>/dev/null \
| openssl x509 -noout -dates | grep 'notAfter=' | cut -d= -f2)

echo "SSL Certificate for $DOMAIN expires on: $expiry_date"
```

---

### 📦 7. **Docker Container Cleanup**

```bash
#!/bin/bash
# Remove exited containers and dangling images

echo "Removing exited containers..."
docker rm $(docker ps -aq -f status=exited)

echo "Removing dangling images..."
docker rmi $(docker images -f dangling=true -q)
```

---

### 📅 8. **Cron Job Setup Script**

```bash
#!/bin/bash
# Schedule a backup script daily

CRON_JOB="0 2 * * * /home/ubuntu/backup.sh >> /var/log/backup.log 2>&1"

(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Backup cron job scheduled."
```

---

Would you like scripts focused on specific tools like Jenkins, Kubernetes, Terraform, or Ansible?
