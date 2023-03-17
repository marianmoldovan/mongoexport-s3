[![Docker Stars](https://img.shields.io/docker/stars/marianmoldovan/mongoexport-s3.svg?style=flat-square)](https://hub.docker.com/r/marianmoldovan/mongoexport-s3)
[![Docker Pulls](https://img.shields.io/docker/pulls/marianmoldovan/mongoexport-s3.svg?style=flat-square)](https://hub.docker.com/r/marianmoldovan/mongoexport-s3/)

Docker Image for MongoDB AWS S3 backups based on [Alpine Linux](http://www.alpinelinux.org), [mongodump](https://docs.mongodb.com/manual/reference/program/mongodump/) and [awscli](https://github.com/aws/aws-cli)

Fork from [Tefnet/mongobackup-s3](https://github.com/Tefnet/mongobackup-s3). This is intended to export json files of a collection to S3

## Use

### Environment variables

- `MONGO_HOST` - MongoDB hostname.
- `MONGO_COLLECTION` - MongoDB cpññectopm.
- `S3_BUCKET` - S3 bucket name where backups will be stored.
- `BACKUP_NAME` - Backup file name

## IAM Policy

IAM Policy you need to add to IAM user. Please change `BUCKET_NAME` to your S3 bucket name.

```xml
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1412000000001",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::BUCKET_NAME"
            ]
        },
        {
            "Sid": "Stmt1412000000002",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::BUCKET_NAME/*"
            ]
        }
    ]
}
```

Deploy with Github Action to Docker Hub
