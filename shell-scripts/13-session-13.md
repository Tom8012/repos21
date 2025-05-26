 Plain server --> app runtime(nodejs), create user,create app folder, download the cod , install dependencies, create systemctl services, start the application.

 we do now automation process using shell scripting
 
 user having a root access or not
 store logs
 try to use colors
 install mysql server
 enable it
 start it
 set the root password

 idempotency --> even you run any number of times, its shouldnt change the result

 HTTP GET --> idempotent
 HTTP POST --> chance of duplicates or erros, we need to handle this in programming
 HTTP PUT --> no porb, but we can say it is already updated
 HTTP DELETE --> chance of error, resource not found , handle this in scripting/programming

 shell script is not byself idemotent , we need to set the idempotent

 deployment --> updating new version (rm old code , download new one,install dependencies,restart)