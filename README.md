static-site-terraform
=========

## これは何？
- CloudFrontとS3で作成する静的サイト構成を実現する、tfファイルを集めたTerraformです。

## 使い方
### 1.リポジトリをclone
```
git clone https://github.com/cocoacoco1021/static-site-terraform.git
cd static-site-terraform
```

### 2.main.tfに実行対象のAWSアカウントの情報を記載
```
cp -p terraform.tfvars.example terraform.tfvars
cp -p backend.tf.example backend.tf
```

### 4.実行
```
terraform init
terraform plan
terraform apply
```
