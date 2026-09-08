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
  max_pods = "100"

  # Resource limits for Pods
  PodLimit = {
    cpu    = "500m"
    memory = "1024Mi"
  }

  # Resource limits for PersistentVolumeClaims
  PersistentVolumeClaimLimit = {
    storage = "2G"
  }

  # Resource limits for Containers
  ContainerLimit = {
    cpu    = "500m"
    memory = "1024Mi"
  }
}
```

### Configuration

| Argument                     | Type          | Description                                     | Default                             |
| ---------------------------- | ------------- | ----------------------------------------------- | ----------------------------------- |
| `name`                       | `string`      | Name of the Kubernetes namespace                | `"demo"`                            |
| `labels`                     | `map(string)` | Labels to be applied to the namespace           | `{ mylabel = "label-value" }`       |
| `annotations`                | `map(string)` | Annotations to be applied to the namespace      | `{ mylabel = "label-value" }`       |
| `max_pods`                   | `string`      | Maximum number of Pods allowed in the namespace | `"100"`                             |
| `PodLimit`                   | `map(any)`    | Resource limits for Pods                        | `cpu = "500m"`, `memory = "1024Mi"` |
| `PersistentVolumeClaimLimit` | `map(any)`    | Resource limits for PersistentVolumeClaims      | `storage = "2G"`                    |
| `ContainerLimit`             | `map(any)`    | Resource limits for Containers                  | `cpu = "500m"`, `memory = "1024Mi"` |

### Resource Quotas

The module creates a Kubernetes **ResourceQuota** for the namespace.

The following quota types are configured:

#### Pod count

`max_pods` controls the maximum number of Pods that can exist in the namespace:

```hcl
max_pods = "100"
```

This allows a maximum of **100 Pods** in the namespace.

#### Pod resources

`PodLimit` defines the resource limits for Pods:

```hcl
PodLimit = {
  cpu    = "500m"
  memory = "1024Mi"
}
```

#### PersistentVolumeClaim resources

`PersistentVolumeClaimLimit` defines the storage limit for PersistentVolumeClaims:

```hcl
PersistentVolumeClaimLimit = {
  storage = "2G"
}
```

#### Container resources

`ContainerLimit` defines the resource limits for Containers:

```hcl
ContainerLimit = {
  cpu    = "500m"
  memory = "1024Mi"
}
```

### Complete Example

```hcl
module "ns-demo" {
  source = "Elewartor/ns/kubernetes"

  name = "demo-ns"

  labels = {
    environment = "development"
    team        = "devops"
  }

  annotations = {
    environment = "development"
  }

  max_pods = "100"

  PodLimit = {
    cpu    = "500m"
    memory = "1024Mi"
  }

  PersistentVolumeClaimLimit = {
    storage = "2G"
  }

  ContainerLimit = {
    cpu    = "500m"
    memory = "1024Mi"
  }
}
```

### Run Terraform

Initialize Terraform:

```bash
terraform init
```

Review the planned changes:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

Terraform will create the `demo-ns` namespace and configure a Kubernetes **ResourceQuota** with the specified Pod, PersistentVolumeClaim, and Container limits.

### Verify the ResourceQuota

Check the ResourceQuota:

```bash
kubectl get resourcequota -n demo-ns
```

For detailed information:

```bash
kubectl describe resourcequota -n demo-ns
```

Example:

```text
Name:                   demo-ns-quota
Namespace:              demo-ns
Resource                Used   Hard
--------                ----   ----
pods                    0      100
requests.cpu            0      500m
requests.memory         0      1024Mi
persistentvolumeclaims  0      20
requests.storage        0      2G
limits.cpu              0      500m
limits.memory           0      1024Mi
```
