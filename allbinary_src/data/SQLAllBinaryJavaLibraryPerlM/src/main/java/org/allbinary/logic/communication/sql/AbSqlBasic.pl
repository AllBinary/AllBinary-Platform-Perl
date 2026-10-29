#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::communication::sql::AbSqlBasic;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{sqlConnectionPool} = 'org::allbinary::logic::communication::sql::connection::pool::SqlConnectionPool'->getInstance();
    $self->{databaseConnectionInfoInterface} = undef;
    $self->{connectAttemptCounter} = undef;
    $self->{conn} = undef;
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{stdUtil} = 'org::allbinary::logic::StdUtil'->getInstance();
    $self->{sqlTypeStrings} = 'org::allbinary::logic::communication::sql::SqlTypeStrings'->getInstance();
    $self->{sqlStrings} = 'org::allbinary::logic::communication::sql::SqlStrings'->getInstance();
    $self->{INSERT} = "insert";
    $self->{UPDATE} = "update";
    $self->{FAILED_SQL_STATEMENT} = "Failed\nSQL Statement: ";
    $self->{SUCCESS_SQL_STATEMENT} = "Success\nSQL Statement: ";
    $self->{METHOD_EXECUTED_SQL_STATEMENT} = "executedSQLStatement";
    $self->{METHOD_CREATE} = "create";
    $self->{DATABASE_CREATED_LABEL} = "Database Created: ";
    $self->{DATABASE_CREATION_FAILED_LABEL} = "Database Creation Failed: ";
    $self->{SQL_CONNECTION_FAILED} = "SQL Connection Failed";
    $self->{SQL_CONNECTION_RETRYING} = "SQL Connection Retrying";
    $self->{SQL_CONNECTION_RETRY} = "SQL Connection Retry";
    $self->{METHOD_CREATE_CONNECTION} = "createConnection()";
    $self->{METHOD_INITIALIZE} = "initialize";
    $self->{LOAD_JDBC_DRIVER_FAILED_LABEL} = "Load JDBC Driver Failed: ";
}


sub new {
    my ($class, $databaseConnectionInfoInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{databaseConnectionInfoInterface} = $databaseConnectionInfoInterface;
        $self->{connectAttemptCounter} = 0;
        $self->{conn} = undef;
    return $self;
}


# throws SQLException
sub executeSQLStatement {
    my ($self, $statement) = @_;
        try {
            $self->initialize();
            my $stmt = $self->{conn}->createStatement();
            $stmt->execute($statement);
            my $rset = $stmt->getResultSet();
            $stmt->close();
            my $tempConnection = $self->{conn};
            $self->{conn} = undef;
            $self->{sqlConnectionPool}->add($self->getDatabaseConnectionInfoInterface()->getUrl(), $tempConnection);
            return $rset;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} . $statement, $self, $self->{METHOD_EXECUTED_SQL_STATEMENT}, $e);
            }
            $self->{conn}->close();
            $self->{conn} = undef;
            die $e;
        }
}


sub create {
    my ($self, $databaseName) = @_;
        try {
            $self->executeSQLStatement($self->{sqlStrings}->{CREATE_DATABASE} . $databaseName);
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{DATABASE_CREATED_LABEL} . $databaseName, $self, $self->{METHOD_CREATE});
            }
            return $databaseName . $self->{sqlStrings}->{CREATE_RETURN};
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{DATABASE_CREATION_FAILED_LABEL} . $databaseName, $self, $self->{METHOD_CREATE}, $e);
            }
            return $self->{DATABASE_CREATION_FAILED_LABEL} . $databaseName;
        }
}


sub createConnection {
    my ($self) = @_;
        try {
            $self->{conn} = $self->{sqlConnectionPool}->get($self->getDatabaseConnectionInfoInterface()->getUrl());
        } catch ($se) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{SQL_CONNECTION_RETRYING}, $self, $self->{METHOD_CREATE_CONNECTION}, $se);
            }
            try {
                'java::lang::Thread'->currentThread()->sleep(2000);
                if ($self->{connectAttemptCounter} < 10) {
                    $self->{connectAttemptCounter}++;
                    $self->initialize();
                }
            } catch ($e) {
                if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                    $self->{logUtil}->put($self->{SQL_CONNECTION_RETRY} . ("" . $se), $self, $self->{METHOD_CREATE_CONNECTION}, $e);
                }
            }
        }
}


sub initialize {
    my ($self) = @_;
        try {
            {
                try {
                    my $loader = 'java::lang::Thread'->currentThread()->getContextClassLoader();
                    my $jdbcDriverClass = $loader->loadClass($self->getDatabaseConnectionInfoInterface()->getJdbcDriver());
                    $jdbcDriverClass->newInstance();
                } catch ($e) {
                    if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                        $self->{logUtil}->put($self->{LOAD_JDBC_DRIVER_FAILED_LABEL} . $self->getDatabaseConnectionInfoInterface()->getJdbcDriver(), $self, $self->{METHOD_INITIALIZE}, $e);
                    }
                }
            }
            $self->createConnection();
        } catch ($se) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{SQL_CONNECTION_FAILED}, $self, $self->{METHOD_INITIALIZE}, $se);
            }
        }
}


sub getDatabaseConnectionInfoInterface {
    my ($self) = @_;
        return $self->{databaseConnectionInfoInterface};
}


sub setDatabaseConnectionInfoInterface {
    my ($self, $databaseConnectionInfoInterface) = @_;
        $self->{databaseConnectionInfoInterface} = $databaseConnectionInfoInterface;
}

# use java::sql::Connection;
# use java::sql::ResultSet;
# use java::sql::SQLException;
# use java::sql::Statement;
use org::allbinary::business::init::db::DatabaseConnectionInfoInterface;
use org::allbinary::business::init::db::DbConnectionInfo;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::connection::pool::SqlConnectionPool;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::sql::SqlTypeStrings;
use org::allbinary::logic::communication::sql::SqlStrings;
use java::lang::Thread;

1;

