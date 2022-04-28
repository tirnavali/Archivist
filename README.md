# Archivist(Arşiv Yönetim Yazılımı)


# Authorization Specifications
- Application has 5 levels of authentication

1. User 

2. Superadmin
3. Admin
4. Manager
5. Chief
- User can sign up
- User can delete his/her  account
- Users can change passwords
- Users can save their forgetton passwords
- Users can manage through admin
- Admins can ban/lock users' acoount
- Admins can CRUD new users with roles 
---
# System dependencies
- Ruby version > 3
- Rails version > 7
- Redis
- minio
- postgresql or mssql for database

#  Configuration 
## Configuration of minio
- This projects use standalone version of [minio](https://docs.min.io/minio/baremetal/installation/deploy-minio-standalone.html). Maybe later we can change it to distrubuted version. 
1. Install minio
2. Enter minio console
3. Create bucket for application
4. Create user for application
5. Create group for application
6. Give a read/write permisson for group
7. Assign user to group
8. Go and configure minio region to turkey or which you want


* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
