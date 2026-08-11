## Usage

### Create a Kubernetes Namespace

Add the following module to your Terraform configuration:

```hcl
module "ns-demo" {
  source = "Elewartor/ns/kubernetes"

  name = "demo-ns"

  annotations = {
    mylabel = "label-value"
  }

  labels = {
    mylabel = "label-value"
  }

  # Maximum number of Pods allowed in the namespace
  max_pods = 100
}
```

### Configuration

| Argument      | Description                                     |
| ------------- | ----------------------------------------------- |
| `source`      | Terraform module source                         |
| `name`        | Name of the Kubernetes namespace                |
| `annotations` | Kubernetes namespace annotations                |
| `labels`      | Kubernetes namespace labels                     |
| `max_pods`    | Maximum number of Pods allowed in the namespace |

In this example, `max_pods = 100` means that the `demo-ns` namespace can have **up to 100 Pods**.

### Run Terraform

Initialize Terraform:

```bash
terraform init
```

Apply the configuration:

```bash
terraform apply
```

Terraform will create the namespace and configure a Kubernetes **ResourceQuota** limiting the namespace to 100 Pods.
