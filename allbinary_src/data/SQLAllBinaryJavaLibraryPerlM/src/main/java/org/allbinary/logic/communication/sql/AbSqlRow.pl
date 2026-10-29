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

package org::allbinary::logic::communication::sql::AbSqlRow;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlColumn';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{EQUAL_QUOTE} = "=\"";
    $self->{ESCAPE_QUOTES} = "\\\"";
    $self->{GET_ROW} = "Row Value: ";
    $self->{METHOD_GET_ROW} = "getRow()";
    $self->{METHOD_GET_ROWS} = "getRows()";
    $self->{METHOD_GET_ALL_ROWS} = "getAllRows()";
    $self->{METHOD_UPDATE_WHERE} = "updateWhere()";
    $self->{METHOD_GET_ROWS_WHERE_BETWEEN} = "getRowsWhereBetween()";
    $self->{METHOD_DELETE_WHERE} = "deleteWhere()";
    $self->{ROW_VALUE_LABEL} = "Row Value: ";
    $self->{ROW_VALUES_LABEL} = "Row Values: ";
    $self->{NO_RESULTS_IN_RESULT_SET} = "No Results in ResultSet";
    $self->{COLUMN_NAME_LABEL} = "columnName: ";
    $self->{INSERT_END} = "')";
}


sub new {
    my ($class, $databaseConnectionInfoInterface) = @_;
    my $self = $class->SUPER::new($databaseConnectionInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getValue {
    my ($self, $value) = @_;
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($value)) {
            return $self->{stringUtil}->{EMPTY_STRING};
        } else {
            return $value;
        }
}


sub updateWhere {
    my ($self, $key, $value, $updatedKeyValuePairs) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{UPDATE});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{SET});
        try {
            my $keyArray = $updatedKeyValuePairs->keySet()->toArray();
            my $size = scalar(@{$keyArray});
            for (my $i = 0; $i < $size; $i++) {
                my $columnName = $keyArray->[$i]->toString();
                $stringBuffer->append($self->{commonSeps}->{SPACE});
                $stringBuffer->append($columnName);
                $stringBuffer->append($self->{EQUAL_QUOTE});
                my $columnValue = $updatedKeyValuePairs->get($columnName);
                if (!defined($columnValue)) {
                    $columnValue = $self->{stringUtil}->{EMPTY_STRING};
                } else {
                    $columnValue = 'org::allbinary::logic::string::regex::replace::Replace'->new($self->{sqlStrings}->{CLOSE_QUOTE}, $self->{ESCAPE_QUOTES})->all($columnValue);
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
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{SUCCESS_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_UPDATE_WHERE});
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} + $stringBuffer, $self, $self->{METHOD_UPDATE_WHERE}, $e);
            }
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub updateWhere {
    my ($self, $whereKeyValuePairs, $updatedKeyValuePairs) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{UPDATE});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{SET});
        try {
            my $keyArray = $updatedKeyValuePairs->keySet()->toArray();
            my $size = scalar(@{$keyArray});
            for (my $i = 0; $i < $size; $i++) {
                my $columnName = $keyArray->[$i]->toString();
                $stringBuffer->append($self->{commonSeps}->{SPACE});
                $stringBuffer->append($columnName);
                $stringBuffer->append($self->{EQUAL_QUOTE});
                if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{COLUMN_NAME_LABEL} . $columnName, $self, $self->{METHOD_UPDATE_WHERE});
                }
                my $columnValue = $updatedKeyValuePairs->get($columnName);
                if (!defined($columnValue)) {
                    $columnValue = $self->{stringUtil}->{EMPTY_STRING};
                } else {
                    $columnValue = 'org::allbinary::logic::string::regex::replace::Replace'->new($self->{sqlStrings}->{CLOSE_QUOTE}, $self->{ESCAPE_QUOTES})->all($columnValue);
                }
                $stringBuffer->append($self->getValue($columnValue));
                $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
                if ($i < $size - 1) {
                    $stringBuffer->append($self->{commonSeps}->{COMMA});
                }
            }
            $stringBuffer->append($self->{sqlStrings}->{WHERE});
            my $set = $whereKeyValuePairs->keySet();
            my $keyArray2 = $set->toArray();
            my $size2 = scalar(@{$keyArray2});
            for (my $i = 0; $i < $size2; $i++) {
                my $key = $keyArray2->[$i];
                my $value = $whereKeyValuePairs->get($key);
                {
                    $stringBuffer->append($key);
                    $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
                    $stringBuffer->append($self->getValue($value));
                    $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
                    if ($i < $size2 - 1) {
                        $stringBuffer->append($self->{sqlStrings}->{AND});
                    }
                }
            }
            my $sqlStatement = $stringBuffer->toString();
            $self->executeSQLStatement($sqlStatement);
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{SUCCESS_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_UPDATE_WHERE});
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} + $stringBuffer, $self, $self->{METHOD_UPDATE_WHERE}, $e);
            }
            die $e;
        }
}


sub deleteWhere {
    my ($self, $key, $value) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{DELETE});
        $stringBuffer->append($self->{sqlStrings}->{FROM});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{WHERE});
        $stringBuffer->append($key);
        $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
        $stringBuffer->append($value);
        $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
        try {
            my $sqlStatement = $stringBuffer->toString();
            $self->executeSQLStatement($sqlStatement);
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{SUCCESS_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_DELETE_WHERE});
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} . $stringBuffer->toString(), $self, $self->{METHOD_DELETE_WHERE}, $e);
            }
        }
}


# Java overloaded method: Perl keeps the last definition
sub deleteWhere {
    my ($self, $keysAndValues) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{DELETE});
        $stringBuffer->append($self->{sqlStrings}->{FROM});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{WHERE});
        try {
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
            $self->executeSQLStatement($sqlStatement);
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{SUCCESS_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_DELETE_WHERE});
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} . $stringBuffer->toString(), $self, $self->{METHOD_DELETE_WHERE}, $e);
            }
        }
}


sub insert {
    my ($self, $values) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{INSERT_INTO});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{VALUES});
        try {
            for (my $i = 0; $i < $values->size() - 1; $i++) {
                my $value = $self->getValue($values->get($i));
                $value = 'org::allbinary::logic::string::regex::replace::Replace'->new($self->{sqlStrings}->{ESCAPE}, $self->{sqlStrings}->{DOUBLE_ESCAPE})->all($value);
                $stringBuffer->append($value);
                $stringBuffer->append($self->{sqlStrings}->{SINGLE_QUOTE_COMMA_SEP});
            }
            my $value = $self->getValue($values->get($values->size() - 1));
            $value = 'org::allbinary::logic::string::regex::replace::Replace'->new($self->{sqlStrings}->{ESCAPE}, $self->{sqlStrings}->{DOUBLE_ESCAPE})->all($value);
            $stringBuffer->append($value);
            $stringBuffer->append($self->{INSERT_END});
            my $sqlStatement = $stringBuffer->toString();
            $self->executeSQLStatement($sqlStatement);
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{SUCCESS_SQL_STATEMENT} . $sqlStatement, $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} . $stringBuffer->toString(), $self, $self->{INSERT}, $e);
            }
        }
}


sub getRow {
    my ($self, $keysAndValues) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT_ALL_FROM});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{WHERE});
        try {
            my $result = undef;
            my $set = $keysAndValues->keySet();
            my $keyArray = $set->toArray();
            my $size = scalar(@{$keyArray});
            for (my $index = 0; $index < $size; $index++) {
                my $key = $keyArray->[$index];
                my $value = ("" . $keysAndValues->get($key));
                $stringBuffer->append($key);
                $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
                $stringBuffer->append($self->getValue($value));
                $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
                if ($index < $size - 1) {
                    $stringBuffer->append($self->{sqlStrings}->{AND});
                }
            }
            my $sqlStatement = $stringBuffer->toString();
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{sqlStrings}->{SQL_STATEMENT_LABEL} . $sqlStatement, $self, $self->{METHOD_GET_ROW});
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
                if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{ROW_VALUE_LABEL} . $result->toString(), $self, $self->{METHOD_GET_ROW});
                }
                return $result;
            }
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->putF($self->{NO_RESULTS_IN_RESULT_SET}, $self, $self->{METHOD_GET_ROW});
            }
            return undef;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} + $stringBuffer, $self, $self->{METHOD_GET_ROW}, $e);
            }
            return undef;
        }
}


sub getRows {
    my ($self, $keysAndValues) = @_;
        return $self->getRows($keysAndValues, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


# Java overloaded method: Perl keeps the last definition
sub getRows {
    my ($self, $keysAndValues, $more) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT_ALL_FROM});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{WHERE});
        try {
            my $rows = 'org::allbinary::util::BasicArrayListD'->new();
            my $set = $keysAndValues->keySet();
            my $keyArray = $set->toArray();
            my $size = scalar(@{$keyArray});
            for (my $index = 0; $index < $size; $index++) {
                my $key = $keyArray->[$index];
                my $value = ("" . $keysAndValues->get($key));
                $stringBuffer->append($key);
                $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
                $stringBuffer->append($self->getValue($value));
                $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
                if ($index < $size - 1) {
                    $stringBuffer->append($self->{sqlStrings}->{AND});
                }
            }
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{sqlStrings}->{SQL_STATEMENT_LABEL} + $stringBuffer, $self, $self->{METHOD_GET_ROWS});
            }
            $stringBuffer->append($more);
            my $sqlStatement = $stringBuffer->toString();
            my $rset = $self->executeSQLStatement($sqlStatement);
            my $resultSetMetaData = $rset->getMetaData();
            while ($rset->next()) {
                my $result = $self->{stdUtil}->createHashMap();
                my $columnCount = $resultSetMetaData->getColumnCount();
                for (my $index = 1; $index <= $columnCount; $index++) {
                    my $columnName = $resultSetMetaData->getColumnName($index);
                    my $field = $rset->getString($columnName);
                    $result->put($columnName, $field);
                }
                my $resultAsString = $result->toString();
                if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{GET_ROW} . $resultAsString, $self, $self->{METHOD_GET_ROWS});
                }
                $rows->add($result);
            }
            return $rows;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} + $stringBuffer, $self, $self->{METHOD_GET_ROWS}, $e);
            }
            return undef;
        }
}


sub getAllRows {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT_ALL_FROM});
        $stringBuffer->append($self->getTableName());
        try {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{sqlStrings}->{SQL_STATEMENT_LABEL} + $stringBuffer, $self, $self->{METHOD_GET_ALL_ROWS});
            }
            my $rows = 'org::allbinary::util::BasicArrayListD'->new();
            my $sqlStatement = $stringBuffer->toString();
            my $rset = $self->executeSQLStatement($sqlStatement);
            my $resultSetMetaData = $rset->getMetaData();
            while ($rset->next()) {
                my $result = $self->{stdUtil}->createHashMap();
                my $columnCount = $resultSetMetaData->getColumnCount();
                for (my $index = 1; $index <= $columnCount; $index++) {
                    my $columnName = $resultSetMetaData->getColumnName($index);
                    my $field = $rset->getString($columnName);
                    $result->put($columnName, $field);
                }
                if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{ROW_VALUES_LABEL} . $result->toString(), $self, $self->{METHOD_GET_ALL_ROWS});
                }
                $rows->add($result);
            }
            return $rows;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} + $stringBuffer, $self, $self->{METHOD_GET_ALL_ROWS}, $e);
            }
            return undef;
        }
}


sub getRowsWhereBetween {
    my ($self, $whereKeyValuePairs, $betweenColumn, $smallest, $largest) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT_ALL_FROM});
        $stringBuffer->append($self->getTableName());
        try {
            my $rows = 'org::allbinary::util::BasicArrayListD'->new();
            $stringBuffer->append($self->{sqlStrings}->{WHERE});
            my $set = $whereKeyValuePairs->keySet();
            my $key = undef;
            my $value = undef;
            my $keyArray = $set->toArray();
            my $size = scalar(@{$keyArray});
            for (my $index = 0; $index < $size; $index++) {
                $key = $keyArray->[$index];
                $value = $whereKeyValuePairs->get($key);
                $stringBuffer->append($key);
                $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
                $stringBuffer->append($self->getValue($value));
                $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
                $stringBuffer->append($self->{sqlStrings}->{AND});
            }
            $stringBuffer->append($betweenColumn);
            $stringBuffer->append($self->{sqlStrings}->{MORE_THAN_QUOTE});
            $stringBuffer->append($smallest);
            $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
            $stringBuffer->append($self->{sqlStrings}->{AND});
            $stringBuffer->append($betweenColumn);
            $stringBuffer->append($self->{sqlStrings}->{LESS_THAN_QUOTE});
            $stringBuffer->append($largest);
            $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
            my $sqlStatement = $stringBuffer->toString();
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{sqlStrings}->{SQL_STATEMENT_LABEL} . $sqlStatement, $self, $self->{METHOD_GET_ROWS_WHERE_BETWEEN});
            }
            my $rset = $self->executeSQLStatement($sqlStatement);
            my $resultSetMetaData = $rset->getMetaData();
            my $result = undef;
            my $columnNames = undef;
            my $columnCount = 0;
            my $columnName = undef;
            my $field = undef;
            while ($rset->next()) {
                $result = $self->{stdUtil}->createHashMap();
                $columnNames = 'org::allbinary::util::BasicArrayListD'->new();
                $columnCount = $resultSetMetaData->getColumnCount();
                for (my $index = 1; $index <= $columnCount; $index++) {
                    $columnName = $resultSetMetaData->getColumnName($index);
                    $field = $rset->getString($columnName);
                    $result->put($columnName, $field);
                }
                if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{ROW_VALUE_LABEL} . $result->toString(), $self, $self->{METHOD_GET_ROWS_WHERE_BETWEEN});
                }
                $rows->add($result);
            }
            return $rows;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} + $stringBuffer, $self, $self->{METHOD_GET_ROWS_WHERE_BETWEEN}, $e);
            }
            return undef;
        }
}


# Java overloaded method: Perl keeps the last definition
sub getRowsWhereBetween {
    my ($self, $betweenColumn, $smallest, $largest) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT_ALL_FROM});
        $stringBuffer->append($self->getTableName());
        try {
            my $rows = 'org::allbinary::util::BasicArrayListD'->new();
            $stringBuffer->append($self->{sqlStrings}->{WHERE});
            $stringBuffer->append($betweenColumn);
            $stringBuffer->append($self->{sqlStrings}->{MORE_THAN_QUOTE});
            $stringBuffer->append($smallest);
            $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
            $stringBuffer->append($self->{sqlStrings}->{AND});
            $stringBuffer->append($betweenColumn);
            $stringBuffer->append($self->{sqlStrings}->{LESS_THAN_QUOTE});
            $stringBuffer->append($largest);
            $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
            my $sqlStatement = $stringBuffer->toString();
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{sqlStrings}->{SQL_STATEMENT_LABEL} . $sqlStatement, $self, $self->{METHOD_GET_ROWS_WHERE_BETWEEN});
            }
            my $rset = $self->executeSQLStatement($sqlStatement);
            my $resultSetMetaData = $rset->getMetaData();
            my $columnName = undef;
            my $field = undef;
            my $result = undef;
            my $columnNames = undef;
            my $columnCount = 0;
            while ($rset->next()) {
                $result = $self->{stdUtil}->createHashMap();
                $columnNames = 'org::allbinary::util::BasicArrayListD'->new();
                $columnCount = $resultSetMetaData->getColumnCount();
                for (my $index = 1; $index <= $columnCount; $index++) {
                    $columnName = $resultSetMetaData->getColumnName($index);
                    $field = $rset->getString($columnName);
                    $result->put($columnName, $field);
                }
                if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{ROW_VALUE_LABEL} . $result->toString(), $self, $self->{METHOD_GET_ROWS_WHERE_BETWEEN});
                }
                $rows->add($result);
            }
            return $rows;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} + $stringBuffer, $self, $self->{METHOD_GET_ROWS_WHERE_BETWEEN}, $e);
            }
            return undef;
        }
}

# use java::sql::ResultSet;
# use java::sql::ResultSetMetaData;
use java::util::HashMap;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::init::db::DbConnectionInfo;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::logic::communication::sql::AbSqlColumn;

1;

