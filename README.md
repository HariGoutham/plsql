# plsql
PL SQL fundamentals

Download and setup DB :
https://drive.google.com/drive/folders/1fjwroJ7qFdPV5_lEJYHorGjZoSYwIC5F?usp=sharing

Client plsql developer:
https://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html

Create a user:

CREATE USER INVENTORY1 IDENTIFIED BY INVENTORY1;
GRANT CONNECT, RESOURCE, DBA TO INVENTORY1;
GRANT CREATE SESSION, GRANT ANY PRIVILEGE TO INVENTORY1;
GRANT UNLIMITED TABLESPACE TO INVENTORY1;
