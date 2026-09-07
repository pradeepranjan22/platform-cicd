# Argo CD Platform

## Purpose

This directory contains the declarative platform configuration for
Argo CD running on the Lab 10.12 EKS cluster.

## Ownership

Terraform owns AWS infrastructure and foundational EKS resources.

Argo CD platform manifests own the Argo CD GitOps platform configuration.

Argo CD owns application reconciliation after an Application is created.

## Directory Structure

```text
argocd-platform/
├── install/
│   ├── namespace.yaml
│   ├── argocd-install.yaml
│   └── kustomization.yaml
│
├── projects/
│   └── platform-project.yaml
│
├── applications/
│   └── sample-java-app.yaml
│
├── bootstrap/
│   └── root-application.yaml
│
└── README.md