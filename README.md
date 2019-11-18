 # Simple planner
 

 ### Introduction

 ### Getting started
 site 
 
 **What was used in development**
 
 * JDK 1.8 
 * mySQL
 * Spring Boot 2.1.6.RELEASE
 * Maven
 * Freemarker
 
 Method	| Path	| Description	
 --- | --- | --- |
 POST	| /login	| User authentication	
 POST	| /registration	| User registration	
  
 ##### User API instruction
 Method	| Path	| Description	
 --- | --- | --- |
 GET	| /user	| Get all users data	
 GET	| /user/{id}	| Get specified user data	
 POST	| /user{id}	| Edit specified user data	


 
  
 ##### Masters API instruction 
 Method	| Path	| Description	
 --- | --- | --- |
 GET	| /masterlist	| Get all masters data, access for users/admins 
 GET    | /masterCreate | Get form masters data, access for masters  
 GET	| /master/{id}	| Get account data with specified  id	
 POST	| /master/{id}	| Create new message data for concrete master  
 POST   | /masterEdit   | Create account master 
  
 
   
 ##### Message API instruction
 Method	| Path	| Description	
 --- | --- | --- |
 GET	| /messages	| Get all messages data	
 POST	| /messageDelete/{id}	| Delete specified messages data access for users	
 POST	| /messageActive/{id}	| Active specified messages data access for masters	




