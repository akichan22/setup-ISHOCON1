## これなに

ISHOCON1の環境をterraformで準備するやつです

## 使い方

1. `terraform init`でモジュールを取ってきます。

    ```bash
    $ terraform init
    ```

1. `terraform.tfvars`にawsのaccess keyとsecret keyを書いておきます。

    ```
    access_key = "XXXXXXXXXXXXXXXXXXXX"
    secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    ```

    ```bash
    $ tree
    .
    ├── README.md
    ├── main.tf
    ├── output.tf
    ├── provider.tf
    ├── terraform.tfvars
    └── variables.tf
    ```

1. `terraform plan`して確認ののち、`terraform apply`します。

1. ssh

    ```bash
    $ ssh -i ~/.ssh/aws.key ec2-user@xxx.xxx.xxx.xxx
    ```

1. 終わったら`destroy`

    ```bash
    $ terraform destroy
    aws_security_group.ishocon: Refreshing state... (ID: sg-855b1ffd)
    aws_instance.ishocon-1: Refreshing state... (ID: i-0161d257d433e30a7)
    
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      - destroy
    
    Terraform will perform the following actions:
    
      - aws_instance.ishocon-1
    
      - aws_security_group.ishocon
    
    
    Plan: 0 to add, 0 to change, 2 to destroy.
    
    Do you really want to destroy?
      Terraform will destroy all your managed infrastructure, as shown above.
      There is no undo. Only 'yes' will be accepted to confirm.
    
      Enter a value: yes
    
    aws_instance.ishocon-1: Destroying... (ID: i-0161d257d433e30a7)
    
    aws_instance.ishocon-1: Still destroying... (ID: i-0161d257d433e30a7, 10s elapsed)
    aws_instance.ishocon-1: Still destroying... (ID: i-0161d257d433e30a7, 20s elapsed)
    aws_instance.ishocon-1: Still destroying... (ID: i-0161d257d433e30a7, 30s elapsed)
    aws_instance.ishocon-1: Destruction complete after 30s
    aws_security_group.ishocon: Destroying... (ID: sg-855b1ffd)
    aws_security_group.ishocon: Destruction complete after 0s
    
    Destroy complete! Resources: 2 destroyed.

    ```
