# Archivist(Arşiv Yönetim Yazılımı)


# Authorization Specifications
- Application has 5 levels of authentication

1. Superadmin # Site manager has all privileges.
2. User       # Data reader. Don't have to create, update or delete permission for all models.
3. Admin      # Content manager and User supervisor,  don't have to delete permission for some models.
4. Editor     # Content editor and writer, don't have to delete permission for some models.
5. Writer     # Data writer. Writers don't have any update, edit or delete persmission for some models. 

## Authorization Table
| Models            | Admin | Editor | Writer | User |
|-------------------|-------|--------|--------|------|
| Fond              | CRU   | CRU    | UR     | R    |
| Language          | CRU   | CR     | R      | R    |
| Number Type       | CRUD  | CRUD   | R      | R    |
| Organization      | CRUD  | CRUD   | CRU    | R    |
| Person            | CRUD  | CRUD   | CRU    | R    |
| Phisycal Status   | CRUD  | CRU    | R      | R    |
| Privacy           | CRUD  | CRU    | R      | R    |
| Record Attachment | CRUD  | CRU    | CR     | R    |
| Record Metadatum  | CRUD  | CRU    | CR     | R    |
| Special Number    | CRUD  | CRU    | CRU    | R    |
| Subject           | CRUD  | CRUD   | R      | R    |
| Toponym           | CRUD  | CRUD   | CR     | R    |
| User              | CRU   |        |        |      |
| Vacation          | CRUD  | CRUD   | CRUD   |      |

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
