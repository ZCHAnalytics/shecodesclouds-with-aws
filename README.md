# AWS Cloud Resume Challenge

This repository contains the **frontend and backend implementation** of the [Cloud Resume Challenge](https://cloudresumechallenge.dev/), deployed entirely on **Amazon Web Services**.

## Overview
- **Frontend**: Static résumé website hosted in an **S3 bucket** and distributed securely through **CloudFront**. HTML/CSS/JavaScript résumé page. Calls the visitor counter API via POST request.  

- **Backend**: A **serverless visitor counter API** built with AWS **Lambda** in Python, fronted by **API Gateway** with CORS enabled, and persisting data in **DynamoDB**.  


- **Security**: IAM non-root developer user managed with **AWS Identity Center (SSO)**. IAM roles scoped with **least privilege permissions**. CloudWatch Alarms on traffic anomalies (per 1 minute) with SNS notifications.  

---