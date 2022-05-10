## Set up AWS
Write-Output "Prerequisite - Set up AWS"
aws configure

## Task 1
Write-Output "Task 1 - Build 3 tier environment"
$plan = "plan.out"
terraform fmt --recursive
terraform validate
terraform plan -out=$plan
terraform apply $plan

## Task 2
Write-Output "Task 2 - Output instance metadata in JSON format"
$json = (aws ec2 describe-instances --max-items 1)
Write-Output $json

## Task 3
Write-Output "Task 3 - Read JSON object data using a/b/c path reference"
$object = $json | ConvertFrom-Json 
$jsonPath = "Reservations/Instances/ImageId"
foreach ($path in $jsonPath.Split("/")) {
    $object = $object.$path
}
Write-Output $object