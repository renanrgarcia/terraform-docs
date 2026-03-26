# Repository Guidelines

## Project Structure & Module Organization
This repository is organized as independent Terraform labs under [`lab00`](/C:/Users/16864107/Projects/terraform-docs/lab00) through [`lab04`](/C:/Users/16864107/Projects/terraform-docs/lab04). Each lab is self-contained and typically includes `main.tf` plus supporting files such as `variables.tf`, `outputs.tf`, or data source definitions. The root [`README.md`](/C:/Users/16864107/Projects/terraform-docs/README.md) is minimal, so contributors should keep each lab understandable on its own.

## Build, Test, and Development Commands
Run Terraform commands from the target lab directory, not from the repository root.

- `terraform init`: downloads providers and configures the backend for that lab.
- `terraform fmt -recursive`: normalizes HCL formatting across all labs.
- `terraform validate`: checks syntax and configuration validity after init.
- `terraform plan`: previews infrastructure changes before apply.
- `terraform apply`: provisions or updates resources. Use carefully with Azure-backed labs.

Example:
```powershell
cd lab03
terraform init
terraform validate
terraform plan
```

## Coding Style & Naming Conventions
Use standard Terraform formatting with 2-space indentation and keep one resource or variable block per logical unit. Follow the existing naming pattern: lowercase Terraform identifiers with underscores for resource names and descriptive file names such as `variables.tf` and `outputs.tf`. Keep Azure resource names derived from variables when possible, and avoid hardcoding secrets in tracked files.

## Testing Guidelines
There is no separate automated test suite in this repository. Validation is Terraform-based: run `terraform fmt -check`, `terraform validate`, and `terraform plan` in the lab you changed. When a lab uses a remote backend or Azure data sources, confirm credentials and backend settings before planning.

## Commit & Pull Request Guidelines
Recent commits use short, imperative summaries such as `Add Terraform configuration for lab03 including resource group and Kubernetes cluster`. Keep commits focused on one lab or one logical change. Pull requests should include a concise description, the lab(s) affected, any backend or Azure prerequisites, and the result of `terraform validate` or `terraform plan`. Include plan output snippets only when they clarify a non-obvious infrastructure change.

## Security & Configuration Tips
`.gitignore` already excludes `.terraform`, state files, and `.tfvars`. Preserve that pattern. Do not commit credentials, passwords, subscription IDs, or local override files; prefer environment variables or ignored `*.tfvars` files for sensitive values.
