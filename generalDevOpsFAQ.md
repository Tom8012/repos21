Got it! Here’s a list of common **DevOps interview questions**, covering concepts, tools, and practices:

---

### DevOps Interview Questions

#### **General DevOps Concepts**

1. What is DevOps and why is it important?
2. Explain the difference between continuous integration, continuous delivery, and continuous deployment.
3. What are some common DevOps tools you have used?
4. What is infrastructure as code (IaC)? Can you name some IaC tools?
5. How do you ensure security in a DevOps pipeline?
6. What is the role of monitoring and logging in DevOps?
7. Explain the concept of “shift-left” testing in DevOps.
8. What is a blue-green deployment and why is it used?
9. How do you handle rollback in deployments?
10. What are containers and how do they fit into DevOps?

#### **CI/CD**

11. What is Jenkins? How have you used it?
12. How do you trigger builds in a CI/CD pipeline?
13. How can you implement automated testing in a pipeline?
14. What are some best practices when writing pipeline scripts?
15. Explain how environment variables are used in CI/CD pipelines.

#### **Configuration Management & Automation**

16. What is configuration management?
17. Compare Ansible, Puppet, and Chef.
18. How does Ansible handle idempotency?
19. Have you worked with Dockerfiles? Explain how to write one.
20. How do you manage secrets in your automation pipelines?

#### **Cloud & Infrastructure**

21. What are the benefits of using cloud platforms in DevOps?
22. Explain the difference between IaaS, PaaS, and SaaS.
23. How do you provision infrastructure in AWS/Azure/GCP?
24. What is a Kubernetes cluster? How does it help with scaling?
25. How do you monitor cloud resources effectively?

#### **Culture & Process**

26. How do DevOps practices improve collaboration between development and operations teams?
27. What challenges have you faced adopting DevOps in an organization?
28. How do you measure the success of DevOps initiatives?
29. What is the role of feedback loops in DevOps?
30. How do you stay updated with new DevOps trends and tools?

---

If you want, I can also provide **detailed answers** or **scenario-based questions** for any of these! Just let me know.

Great — you're looking for **DevOps interview questions and answers based on 3 years of experience**. At this level, interviewers expect:

* Solid hands-on experience with CI/CD tools, configuration management, cloud platforms, and scripting.
* Some understanding of system design, scalability, and troubleshooting.
* Real-world problem-solving examples.

---

## 🔥 DevOps Interview Questions for 3 Years Experience

### 🧰 Tools & Automation

**1. What CI/CD tools have you used, and how have you implemented pipelines?**
**Answer:**

> "I’ve worked with Jenkins and GitHub Actions. I created pipelines for build, test, Docker image creation, and deployment to staging/prod. I’ve written Jenkinsfiles using scripted and declarative syntax, and integrated Slack notifications for pipeline status."

---

**2. What’s the difference between `CMD` and `ENTRYPOINT` in a Dockerfile?**
**Answer:**

* `CMD` provides default arguments to a container but can be overridden at runtime.
* `ENTRYPOINT` sets the main executable, making the container behave like a single command.

> Example: You often combine them to make `ENTRYPOINT` the command and `CMD` the args.

---

**3. How do you handle environment-specific configurations in your deployments?**
**Answer:**

* Use separate config files or variables for each environment.
* Inject them via Ansible vars, Helm values, or CI/CD pipeline variables.
* Use secret managers for sensitive values.

---

**4. How do you roll back a failed deployment in your setup?**
**Answer:**

* In Kubernetes: use `kubectl rollout undo`
* In Jenkins or GitHub Actions: deploy the last successful build artifact
* Blue-green or Canary deployments simplify rollback by just switching traffic back

---

### ☁️ Cloud & Infrastructure

**5. What cloud platforms have you worked with? What services have you used?**
**Answer:**

> "I've worked mainly on AWS. I’ve used EC2, S3, IAM, RDS, EKS, and CloudWatch. I’ve deployed infrastructure using Terraform, created EC2 instances with Ansible, and containerized apps using ECR and ECS."

---

**6. Can you describe a Terraform project you've built?**
**Answer:**

> "I wrote Terraform code to create VPCs, subnets, security groups, EC2 instances, and an RDS DB. I used modules and remote state storage with S3 and DynamoDB for state locking."

---

### 🛠️ Monitoring & Security

**7. What tools have you used for monitoring and alerting?**
**Answer:**

> "I’ve used Prometheus and Grafana to monitor application metrics, along with AWS CloudWatch for infrastructure monitoring. Alerts were configured to notify via email and Slack."

---

**8. How do you handle secrets securely in pipelines or config management?**
**Answer:**

> "I use environment variables in CI tools, and secrets are stored in AWS Secrets Manager or HashiCorp Vault. I avoid hardcoding sensitive values and use Ansible Vault to encrypt secrets when needed."

---

### 💡 Problem Solving & Scenarios

**9. Scenario: Your CI pipeline fails at the test stage. What steps do you take?**
**Answer:**

* Check test logs in Jenkins/GitHub Actions.
* Reproduce the issue locally with the same environment.
* Check for dependency or version issues.
* Collaborate with developers to fix and re-trigger the build.

---

**10. Scenario: Production site is slow. Where do you start troubleshooting?**
**Answer:**

> "Check monitoring dashboards for CPU/memory usage, database latency, or network errors. Look at logs via ELK stack or CloudWatch. If app-specific, check Kubernetes pod logs and resource limits. Roll back if recent changes correlate with the issue."

---

## Want More?

* 📄 \[ ] PDF version
* 🔁 \[ ] Mock interview script
* 📋 \[ ] Tool-specific questions (Ansible, Jenkins, Terraform, etc.)
* 🎯 \[ ] Behavioral/HR questions for DevOps roles

Let me know which you'd like next!

Great — you're looking for **DevOps interview questions focused on Ansible**, tailored for someone with **\~3 years of experience**. Below is a list of **real-world, technical, and scenario-based questions**, with **sample answers** to help you prepare confidently.

---

## 🔧 Ansible Interview Questions (for 3 Years Experience)

### 🧠 **Conceptual Understanding**

**1. What is Ansible and how does it work?**
**Answer:**
Ansible is an agentless automation tool that uses SSH to connect to remote machines and execute tasks described in YAML playbooks. It uses modules to manage resources and is idempotent, meaning running the same playbook multiple times gives the same result.

---

**2. What is the difference between a playbook, a role, and a task?**
**Answer:**

* **Playbook**: A YAML file with a list of plays to execute on hosts.
* **Task**: A single unit of work (e.g., install a package).
* **Role**: A structured directory containing tasks, vars, handlers, etc., used for reuse and organization.

---

**3. What are handlers in Ansible? When are they triggered?**
**Answer:**
Handlers are special tasks that run **only when notified** by other tasks (e.g., restarting a service after a config change). They're executed at the end of a play.

---

**4. How do you manage secrets in Ansible?**
**Answer:**

* Use **Ansible Vault** to encrypt files or variables:

  ```bash
  ansible-vault encrypt secrets.yml
  ```
* Vault-encrypted files can be used like regular variables but are secure.

---

**5. What are facts in Ansible? How do you use them?**
**Answer:**
Facts are system information gathered automatically by Ansible (`ansible_facts`). You can use them for conditionals or templates:

```yaml
when: ansible_facts['os_family'] == 'RedHat'
```

---

### 🔧 **Hands-on & Syntax-Based**

**6. How do you pass variables to a playbook?**
**Answer:**

* CLI: `ansible-playbook site.yml -e "user=ec2-user"`
* From a vars file: `vars_files: [ "vars.yml" ]`
* Inventory variables

---

**7. What is the difference between `command` and `shell` modules?**
**Answer:**

* `command`: Executes a command **without shell processing** (no `|`, `>`, `&&`).
* `shell`: Executes via a shell, allowing redirection, pipelines, etc.

---

**8. How do you check for idempotency in your playbooks?**
**Answer:**

* Use built-in modules (like `ansible.builtin.package`) that are idempotent by default.
* Avoid `command/shell` when a module exists.
* Use `creates:` or `removes:` to prevent re-running a command unnecessarily.

---

### 📦 **Scenario-Based Ansible Questions**

**9. Scenario: You need to install different packages on RHEL and Ubuntu. What do you do?**
**Answer:**
Use conditionals based on OS facts:

```yaml
tasks:
  - name: Install Apache on RedHat
    ansible.builtin.yum:
      name: httpd
      state: present
    when: ansible_facts['os_family'] == 'RedHat'

  - name: Install Apache on Debian
    ansible.builtin.apt:
      name: apache2
      state: present
    when: ansible_facts['os_family'] == 'Debian'
```

---

**10. Scenario: You get a "FAILED! => unreachable" error. What are the possible reasons?**
**Answer:**

* SSH unreachable (wrong IP, firewall, or port)
* Wrong user or key in inventory
* Host is down
* Network not configured (e.g., AWS Security Group issue)

---

### 🛠️ **Real-World Tasks**

**11. How do you write an Ansible playbook to deploy a web app (Nginx + code)?**

```yaml
- name: Deploy web app
  hosts: web
  become: yes
  tasks:
    - name: Install Nginx
      ansible.builtin.package:
        name: nginx
        state: present

    - name: Copy website files
      ansible.builtin.copy:
        src: ./website/
        dest: /usr/share/nginx/html/
        mode: 0755

    - name: Start Nginx
      ansible.builtin.service:
        name: nginx
        state: started
        enabled: yes
```

---

**12. How do you debug a playbook that’s not behaving as expected?**
**Answer:**

* Use `-vvv` for verbose output.
* Add `ansible.builtin.debug` statements.
* Use `check_mode: yes` to simulate without making changes.
* Use `ansible.builtin.assert` to validate expectations.

---

### ✅ Want to Practice?

I can simulate a **mock interview** or send you a **PDF cheat sheet** with all of this content for download. What would you prefer?

Also let me know if you want tool-specific deep dives (like Jenkins + Ansible or Ansible + AWS).
