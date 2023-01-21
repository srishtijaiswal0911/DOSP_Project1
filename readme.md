# Distributed Operating System Principles 
### Project - 1
**Group Members:**
  1. Srishti Jaiswal UFID-80385159
  2. Jagannath Jayanti UFID-18567125

**Project Overview:**
  

    As per the given requirements the project involves mining bitcoin throuh string generation and SHA256 algorithm. The project is based on the concepts of distributed systems where one server is connected to multiple devices which can communicate with the server. 
 
**1. Size of the work unit:**

  The required output needs to have the predetermined number of prefix 0s in the hash value generated for that output to be considered a valid bitcoin. Once the required number of client devices are started so as to communicate with the server, the server can then begin with the deployment or spawning of the actors to take the workload of searching for the bitcoins on those client devices. However, once the mining is started, for every hash generated it needs to go through a logic check wherein it is checked for the prefix zeroes. In that aspect each worker takes the load of generating a string, followed by computing its hash throuh the hashing algorithm and after that validating that hash value for the bitcoin. 
  

**2. Bitcoins with 4 prefix 0s result:**

1. Starting the server for bitcoin with 4 0s and 12000 nodes.
<img width="1081" alt="Screen Shot 2022-09-24 at 11 31 26 PM" src="https://user-images.githubusercontent.com/54150291/192127136-a011c6aa-cdc6-4669-b591-50c1f3a31b30.png">



2. Final output for bitcoin with 4 0s.

<img width="1095" alt="Screen Shot 2022-09-24 at 11 31 33 PM" src="https://user-images.githubusercontent.com/54150291/192127157-225478a5-1d1c-4b17-abab-ac7233d812de.png">

3. Connection with other clients
![WhatsApp Image 2022-09-24 at 11 29 47 PM](https://user-images.githubusercontent.com/54150291/192127197-3f089875-0806-4a31-8e6d-556714e4e085.jpeg)


**3. Ratio for Real time and Running time**

  Real time = 198291.966
  
  CPU time = 374059
  
  CPU time/ Run time ratio = 1.886405221278607
  

**4. The Largest Coin:

 The largest that was mined was with 6 leading 0s. The program ran for 20 minutes before finding the first coin, then the subsequent coins were being mined relatively quicker.
 
 <img width="958" alt="Screen Shot 2022-09-24 at 10 40 39 PM" src="https://user-images.githubusercontent.com/54150291/192127381-5bf3177f-e772-4a23-9afd-de97b4948ebd.png">

    
**5. Maximum number of working machines employed.**
  
  The maximum number of working machines in the system were 2, with server and one node on one system and four nodes on the other system.  
  