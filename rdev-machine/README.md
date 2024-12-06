Dot Files and Automation Scripts for Remote Development Machine (AWS)

- **Author:** Apache X692
- **Created on:** 06/12/2024

## AWS Resources

| Resource            | Name                         | Used For                                   |
|---------------------|----------------------------- |--------------------------------------------|
| S3                  | `test-bucket-06122024`       | Secrets Management                         |
| IAM Role            | `test-role-06122024-001`     | IAM Instance Role (read-only access to S3) |
| IAM Role            | `test-role-06122024-002`     | IAM Instance Role (master with AWS CLI)    |
| EC2 Launch Template | `test-template-06122024-001` | EC2 Launch Template                        |
