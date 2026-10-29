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

package org::allbinary::business::init::InitSql;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{sqlTypeStrings} = 'org::allbinary::logic::communication::sql::SqlTypeStrings'->getInstance();
    $self->{sqlStrings} = 'org::allbinary::logic::communication::sql::SqlStrings'->getInstance();
    $self->{stdUtil} = 'org::allbinary::logic::StdUtil'->getInstance();
    $self->{INSERT} = "insert";
    $self->{UPDATE} = "update";
    $self->{databaseConnectionInfoInterface} = undef;
    $self->{userid} = undef;
    $self->{password} = undef;
    $self->{tableName} = undef;
    $self->{conn} = undef;
    $self->{useridAndPassword} = 0;
    $self->{SUCCESS_SQL_STATEMENT} = "Success\nSQL Statement: ";
    $self->{FAILED_SQL_STATEMENT} = "Failed\nSQL Statement: ";
    $self->{INIT_SQL} = "InitSql";
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{EQUAL_QUOTE} = "=\"";
    $self->{METHOD_GET_ROW} = "getRow()";
    $self->{METHOD_UPDATE_WHERE} = "updateWhere()";
    $self->{ROW_VALUE_LABEL} = "Row Value: ";
    $self->{NO_RESULTS_IN_RESULT_SET} = "No Results in ResultSet";
    $self->{INSERT_END} = "')";
}


sub new {
    my ($class, $databaseConnectionInfoInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setDatabaseConnectionInfoInterface($databaseConnectionInfoInterface);
    return $self;
}


sub setTable {
    my ($self, $tableName) = @_;
        $self->{tableName} = $tableName;
}


sub setDatabaseConnectionInfoInterface {
    my ($self, $databaseConnectionInfoInterface) = @_;
        $self->{databaseConnectionInfoInterface} = $databaseConnectionInfoInterface;
}


sub createTable {
    my ($self, $tableData) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Creating Table: ");
            $stringBuffer->append($tableData);
            'org::allbinary::logic::communication::log::PreLogUtil'->put($stringBuffer->toString(), $self->{INIT_SQL}, "createTable()");
            $self->executeSQLStatement($tableData);
            return 1;
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{SQLLOGGINGERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self->{INIT_SQL}, "createTable()", $e);
            }
            return 0;
        }
}


sub dropTable {
    my ($self) = @_;
        my $sqlStatement = $self->{sqlStrings}->{DROP_TABLE} . $self->{tableName};
        try {
            $self->executeSQLStatement($sqlStatement);
            return 1;
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{SQLLOGGINGERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self->{INIT_SQL}, "dropTables()", $e);
            }
            return 0;
        }
}


sub getRow {
    my ($self, $keysAndValues) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT_ALL_FROM});
        $stringBuffer->append($self->{tableName});
        $stringBuffer->append($self->{sqlStrings}->{WHERE});
        try {
            my $result = undef;
            my $set = $keysAndValues->keySet();
            my $keyArray = $set->toArray();
            my $size = scalar(@{$keyArray});
            for (my $i = 0; $i < $size; $i++) {
                my $key = $keyArray->[$i];
                my $value = ("" . $keysAndValues->get($key));
                $stringBuffer->append($key);
                $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
                $stringBuffer->append($self->getValue($value));
                $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
                if ($i < $size - 1) {
                    $stringBuffer->append($self->{sqlStrings}->{AND});
                }
            }
            my $sqlStatement = $stringBuffer->toString();
            if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{sqlStrings}->{SQL_STATEMENT_LABEL} . $sqlStatement, $self->{INIT_SQL}, $self->{METHOD_GET_ROW});
            }
            my $rset = $self->executeSQLStatement($sqlStatement);
            my $resultSetMetaData = $rset->getMetaData();
            while ($rset->next()) {
                $result = $self->{stdUtil}->createHashMap();
                my $columnCount = $resultSetMetaData->getColumnCount();
                for (my $index = 1; $index <= $columnCount; $index++) {
                    my $columnName = $resultSetMetaData->getColumnName($index);
                    my $field = $rset->getString($columnName);
                    $result->put($columnName, $field);
                }
                if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{ROW_VALUE_LABEL} . $result->toString(), $self->{INIT_SQL}, $self->{METHOD_GET_ROW});
                }
                return $result;
            }
            if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{NO_RESULTS_IN_RESULT_SET}, $self->{INIT_SQL}, $self->{METHOD_GET_ROW});
            }
            return undef;
        } catch ($e) {
            if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{FAILED_SQL_STATEMENT} . $stringBuffer, $self->{INIT_SQL}, $self->{METHOD_GET_ROW}, $e);
            }
            return undef;
        }
}


sub updateWhere {
    my ($self, $key, $value, $updatedKeyValuePairs) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{UPDATE});
        $stringBuffer->append($self->{tableName});
        $stringBuffer->append($self->{sqlStrings}->{SET});
        try {
            my $columnArray = $updatedKeyValuePairs->keySet()->toArray();
            my $size = scalar(@{$columnArray});
            for (my $i = 0; $i < $size; $i++) {
                my $columnName = $columnArray->[$i]->toString();
                $stringBuffer->append($self->{commonSeps}->{SPACE});
                $stringBuffer->append($columnName);
                $stringBuffer->append($self->{EQUAL_QUOTE});
                my $columnValue = $updatedKeyValuePairs->get($columnName);
                if (!defined($columnValue)) {
                    $columnValue = $self->{stringUtil}->{EMPTY_STRING};
                } else {
                }
                $stringBuffer->append($self->getValue($columnValue));
                $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
                if ($i < $size - 1) {
                    $stringBuffer->append($self->{commonSeps}->{COMMA});
                }
            }
            $stringBuffer->append($self->{sqlStrings}->{WHERE});
            $stringBuffer->append($key);
            $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
            $stringBuffer->append($self->getValue($value));
            $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
            my $sqlStatement = $stringBuffer->toString();
            $self->executeSQLStatement($sqlStatement);
            if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{SUCCESS_SQL_STATEMENT} . $sqlStatement, $self->{INIT_SQL}, $self->{METHOD_UPDATE_WHERE});
            }
        } catch ($e) {
            if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{FAILED_SQL_STATEMENT} . $stringBuffer, $self->{INIT_SQL}, $self->{METHOD_UPDATE_WHERE}, $e);
            }
        }
}


sub insert {
    my ($self, $values) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{INSERT_INTO});
        $stringBuffer->append($self->{tableName});
        $stringBuffer->append($self->{sqlStrings}->{VALUES});
        try {
            my $size = $values->size();
            for (my $i = 0; $i < $size - 1; $i++) {
                my $value = $self->getValue($values->get($i));
                $stringBuffer->append($value);
                $stringBuffer->append($self->{sqlStrings}->{SINGLE_QUOTE_COMMA_SEP});
            }
            my $value = $self->getValue($values->get($values->size() - 1));
            $stringBuffer->append($value);
            $stringBuffer->append($self->{INSERT_END});
            my $sqlStatement = $stringBuffer->toString();
            $self->executeSQLStatement($sqlStatement);
            if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{SUCCESS_SQL_STATEMENT} . $sqlStatement, $self->{INIT_SQL}, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{FAILED_SQL_STATEMENT} . $stringBuffer->toString(), $self->{INIT_SQL}, $self->{INSERT}, $e);
            }
        }
}


sub getValue {
    my ($self, $value) = @_;
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($value)) {
            return $self->{stringUtil}->{EMPTY_STRING};
        } else {
            return $value;
        }
}


# throws Exception, SQLException
sub executeSQLStatement {
    my ($self, $statement) = @_;
        try {
            if (!defined($self->{conn})) {
                $self->initialize();
            }
            my $stmt = $self->{conn}->createStatement();
            $stmt->execute($statement);
            my $rset = $stmt->getResultSet();
            $stmt->close();
            return $rset;
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{SQLLOGGINGERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self->{INIT_SQL}, "executeSQLStatement()", $e);
            }
            die $e;
        }
}


# throws SQLException
sub createConnection {
    my ($self) = @_;
        try {
            if ($self->{useridAndPassword} == 1) {
                $self->{conn} = 'java::sql::DriverManager'->getConnection($self->{databaseConnectionInfoInterface}->getUrl(), $self->{userid}, $self->{password});
            } else {
                $self->{conn} = 'java::sql::DriverManager'->getConnection($self->{databaseConnectionInfoInterface}->getUrl());
            }
        } catch ($se) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self->{INIT_SQL}, "createConnection()", $se);
            die $se;
        }
}


# throws Exception
sub initialize {
    my ($self) = @_;
        try {
            try {
                my $jdbcDriver = $self->{databaseConnectionInfoInterface}->getJdbcDriver();
                'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append("Loading DbConnnectionInfo: ")->append(ref($self->{databaseConnectionInfoInterface}))->append(" Driver: ")->append($jdbcDriver)->toString(), $self->{INIT_SQL}, "initialize()");
                'org::allbinary::business::init::Class'->forName($jdbcDriver)->newInstance();
            } catch ($e) {
                if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{SQLLOGGINGERROR})) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->putOE("LoadDriver Failed: " . $self->{databaseConnectionInfoInterface}->getJdbcDriver(), $self->{INIT_SQL}, "initialize()", $e);
                }
                die $e;
            }
            if (!defined($self->{userid}) && !defined($self->{password})) {
                $self->{useridAndPassword} = 1;
            }
            $self->createConnection();
        } catch ($se) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{SQLLOGGINGERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self->{INIT_SQL}, "initialize()", $se);
            }
            die $se;
        }
}


sub getDatabaseConnectionInfoInterface {
    my ($self) = @_;
        return $self->{databaseConnectionInfoInterface};
}

# use java::sql::Connection;
# use java::sql::DriverManager;
# use java::sql::ResultSet;
# use java::sql::ResultSetMetaData;
# use java::sql::SQLException;
# use java::sql::Statement;
use java::util::HashMap;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::init::db::DatabaseConnectionInfoInterface;
use org::allbinary::business::init::db::DbConnectionInfo;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::communication::sql::SqlStrings;
use org::allbinary::logic::communication::sql::SqlTypeStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;

1;

