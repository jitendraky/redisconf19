XADD lamp * hostname compute1 microservice mysql-instance1 ‘mysql instance started successfully’
XADD lamp * hostname compute1 microservice apache-instance1 ‘apache service started successfully’
XLEN lamp <start time> <end time>
XREAD COUNT 2 STREAMS mystream 0
the interesting part is that we can turn XREAD in a blocking command easily, by specifying the BLOCK argument:

XREAD BLOCK 0 STREAMS mystream $

xrange lamp - +
1) 1) 1554222422681-0
   2) 1) "hostname"
      2) "compute1"
      3) "data"
      4) "mysql instances started successfuly"
2) 1) 1554222679992-0
   2) 1) "hostname"
      2) "compute1"
      3) "microservice"
      4) "mysql-instance1"
      5) "data"
      6) "mysql instances started successfuly"
3) 1) 1554222722158-0
   2) 1) "hostname"
      2) "compute1"
      3) "microservice"
      4) "apache-instance1"
      5) "data"
      6) "apache service started successfuly"
4) 1) 1554222830098-0
   2) 1) "hostname"
      2) "compute1"
      3) "microservice"
      4) "apache-instance1"
      5) "data"
      6) "apache service started successfuly"
​

 xrange lamp - + COUNT 2
1) 1) 1554222422681-0
   2) 1) "hostname"
      2) "compute1"
      3) "data"
      4) "mysql instances started successfuly"
2) 1) 1554222679992-0
   2) 1) "hostname"
      2) "compute1"
      3) "microservice"
      4) "mysql-instance1"
      5) "data"
      6) "mysql instances started successfuly
      

Listen new events in stream 
XREAD COUNT 2 STREAMS lamp 0
1) 1) "lamp"
   2) 1) 1) 1554222422681-0
         2) 1) "hostname"
            2) "compute1"
            3) "data"
            4) "mysql instances started successfuly"
      2) 1) 1554222679992-0
         2) 1) "hostname"
            2) "compute1"
            3) "microservice"
            4) "mysql-instance1"
            5) "data"
            6) "mysql instances started successfuly"


XGROUP CREATE lamp monitorgroup $
OK

XADD lamp * data "http client request"
1554223757893-0

XADD lamp * data "http client respone 200"
1554223800986-0

GROUP monitorgroup groupmember COUNT 1 STREAMS lamp >
1) 1) "lamp"
   2) 1) 1) 1554223757893-0
         2) 1) "data"
            2) "http client request"


