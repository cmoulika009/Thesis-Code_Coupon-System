#!C:\wamp\bin\perl\bin\perl.exe
# PERL MODULES WE WILL BE USING
use CGI;
use DBI;
#use DBD::mysql;
require "cgi-lib.pl";

# Config DB variables
our $platform = "mysql";
our $database = "registration";
our $host = "localhost";
our $port = "3306";
our $tablename = "users";
our $user = "test";
our $pw = "test";
our $q = new CGI;

# DATA SOURCE NAME
$dsn = "dbi:mysql:$database:localhost:3306";

# PERL DBI CONNECT
$connect = DBI->connect($dsn, $user, $pw);

#Get the parameter from your html form.
$name=$q->param('InputName');
$cname=$q->param('InputCompanyName');
$address=$q->param('InputAddress');
$email=$q->param('InputEmail');
$username=$q->param('Inputusername');
$password=$q->param('Password');


print $q->header; 

$sql="INSERT INTO registration.users(Name,companyName,Address,Email,InputName,Password) values('$name','$cname','$address','$email','$username','$password')";
$sth = $connect->prepare($sql)
or die "Can't prepare $sql: $connect->errstrn";
#pass sql query to database handle..

$rv = $sth->execute
or die "can 't execute the query $sql : $sth->errstrn";
#execute your query

if ($rv==1){
print<<EIOIFE;


		<html>
		<head>
		</head>
		<body>
		Your details are updated to DB Sucessfully 
		</body>
		</html>
		
EIOIFE
}else{
print<<EIOIFE;



		<html>
		<head>
		</head>
		<body>
		Error occured
		</body>
		</html>
		
EIOIFE
exit;
}