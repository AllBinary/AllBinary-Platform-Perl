# 
# To change this license header, choose License Headers in Project Properties. 
# To change this template file, choose Tools | Templates 
# and open the template in the editor.  
# Generated Code Do Not Modify

package org::allbinary::logic::communication::sql::AbDatabaseManagement;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{sqlCommandLog} = 'org::allbinary::logic::string::StringMaker'->new();
    $self->{GRANT_ALL} = "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON ";
    $self->{DOT_STAR} = ".*";
    $self->{TO} = " TO ";
    $self->{AT_LOCALHOST} = "\@localhost";
    $self->{IDENTIFIED_BY} = " IDENTIFIED BY '";
    $self->{WITH_GRANT_OPTION} = "' WITH GRANT OPTION";
    $self->{FAILED} = "Failed";
    $self->{GET_HOST_NAME} = "getHostName()";
    $self->{METHOD_ADD_USER} = "addUser()";
    $self->{METHOD_ADD_USERS} = "addUsers()";
    $self->{METHOD_ADD_DB} = "addDb()";
    $self->{METHOD_ADD_DATABASES} = "addDatabases()";
    $self->{METHOD_ADD_TABLES} = "addTables()";
    $self->{UNABLE_TO_CREATE_USER} = "Unable to Create User: ";
    $self->{UNABLE_TO_CREATE_DATABASE} = "Unable to Create Database: ";
    $self->{UNABLE_TO_CREATE_TABLES} = "Unable to Create Tables";
    $self->{ADD_TABLES_RESULTS_LABEL} = "Add Table Results: ";
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of AbDatabaseManagement takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $databaseConnectionInfoInterface) = @_;
    my $self = $class->SUPER::new($databaseConnectionInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $connectionInfo) = @_;
    my $self = $class->SUPER::new($connectionInfo);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getHostName {
    my ($self) = @_;
        try {
            my $addr = 'java::net::InetAddress'->getLocalHost();
            return $addr->getHostName();
        } catch ($e) {
            $self->{logUtil}->put($self->{FAILED}, $self, $self->{GET_HOST_NAME}, $e);
            return undef;
        }
}


# throws Exception
sub addDbUser {
    my ($self, $hostName, $db, $userName, $password) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{GRANT_ALL});
        $stringBuffer->append($db);
        $stringBuffer->append($self->{DOT_STAR});
        $stringBuffer->append($self->{TO});
        $stringBuffer->append($userName);
        $stringBuffer->append($hostName);
        $stringBuffer->append($self->{IDENTIFIED_BY});
        $stringBuffer->append($password);
        $stringBuffer->append($self->{WITH_GRANT_OPTION});
        my $sqlStatement = $stringBuffer->toString();
        $self->{sqlCommandLog}->append($sqlStatement);
        $self->{sqlCommandLog}->append($self->{commonSeps}->{NEW_LINE});
        $self->SUPER::executeSQLStatement($sqlStatement);
        return 1;
}


# Java overloaded method: Perl keeps the last definition
sub addDbUser {
    my ($self, $db, $userName, $password) = @_;
        try {
            $self->addDbUser($self->{AT_LOCALHOST}, $db, $userName, $password);
            my $hostName = $self->getHostName();
            if (defined($hostName)) {
                $self->addDbUser($hostName, $db, $userName, $password);
            }
            return 1;
        } catch ($e) {
            $self->{logUtil}->put($self->{UNABLE_TO_CREATE_USER} . $userName, $self, $self->{METHOD_ADD_USER}, $e);
            return 0;
        }
}


sub addDb {
    my ($self, $db) = @_;
        try {
            my $sqlStatement = $self->{sqlStrings}->{CREATE_DATABASE} . $db;
            $self->{sqlCommandLog}->append($sqlStatement);
            $self->{sqlCommandLog}->append($self->{commonSeps}->{NEW_LINE});
            $self->SUPER::executeSQLStatement($sqlStatement);
            return 1;
        } catch ($e) {
            $self->{logUtil}->put($self->{UNABLE_TO_CREATE_DATABASE} . $db, $self, $self->{METHOD_ADD_DB}, $e);
            return 0;
        }
}

# use java::net::InetAddress;
use org::allbinary::business::init::db::DatabaseConnectionInfoInterface;
use org::allbinary::business::init::db::DbConnectionInfo;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::sql::AbSqlBean;

1;

