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

package org::allbinary::logic::communication::sql::AbSqlColumn;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlTable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{LARGEST_INT_VALUE_IN_COLUMN} = "\nLargest Int Value in column: ";
    $self->{METHOD_GET_LARGETS_INTEGER_IN_COLUMN} = "getLargestIntegerInColumn";
    $self->{METHOD_GET_COLUMN} = "getColumn";
    $self->{METHOD_GET_COLUMN_WHERE} = "getColumnWhere";
    $self->{INVALID_RESULT} = "-1";
}


sub new {
    my ($class, $databaseConnectionInfoInterface) = @_;
    my $self = $class->SUPER::new($databaseConnectionInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getLargestIntegerInColumnWhere {
    my ($self, $columnName, $key, $value) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT});
        $stringBuffer->append($columnName);
        $stringBuffer->append($self->{sqlStrings}->{FROM});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{WHERE});
        $stringBuffer->append($key);
        $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
        $stringBuffer->append($value);
        $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
        my $sqlStatement = $stringBuffer->toString();
        try {
            my $largest = 0;
            my $rset = $self->executeSQLStatement($sqlStatement);
            while ($rset->next()) {
                my $intValue = $rset->getInt($columnName);
                if ($intValue > $largest) {
                    $largest = $intValue;
                }
            }
            my $largestAsString = $largest->toString();
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append($self->{sqlStrings}->{SQL_STATEMENT_LABEL});
                $stringBuffer->append($sqlStatement);
                $stringBuffer->append($self->{LARGEST_INT_VALUE_IN_COLUMN});
                $stringBuffer->append($largestAsString);
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD_GET_LARGETS_INTEGER_IN_COLUMN});
            }
            return $largestAsString;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_GET_LARGETS_INTEGER_IN_COLUMN}, $e);
            }
            return $self->{INVALID_RESULT};
        }
}


sub getColumn {
    my ($self, $columnName) = @_;
        my $column = 'org::allbinary::util::BasicArrayListD'->new();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT});
        $stringBuffer->append($columnName);
        $stringBuffer->append($self->{sqlStrings}->{FROM});
        $stringBuffer->append($self->getTableName());
        my $sqlStatement = $stringBuffer->toString();
        try {
            my $rset = $self->executeSQLStatement($sqlStatement);
            while ($rset->next()) {
                my $field = $rset->getObject($columnName)->toString();
                $column->add($field);
            }
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append($self->{sqlStrings}->{SQL_STATEMENT_LABEL});
                $stringBuffer->append($sqlStatement);
                $stringBuffer->append($self->{sqlStrings}->{COLUMN_VALUE});
                $stringBuffer->append($column->toString());
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD_GET_COLUMN});
            }
            return $column;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_GET_COLUMN}, $e);
            }
            return $column;
        }
}


sub getColumnWhere {
    my ($self, $columnName, $key, $value) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT});
        $stringBuffer->append($columnName);
        $stringBuffer->append($self->{sqlStrings}->{FROM});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{WHERE});
        $stringBuffer->append($key);
        $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
        $stringBuffer->append($value);
        $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
        my $sqlStatement = $stringBuffer->toString();
        my $column = 'org::allbinary::util::BasicArrayListD'->new();
        my $rset = undef;
        my $field = undef;
        try {
            $rset = $self->executeSQLStatement($sqlStatement);
            while ($rset->next()) {
                $field = $rset->getObject($columnName)->toString();
                $column->add($field);
            }
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append($self->{sqlStrings}->{SQL_STATEMENT_LABEL});
                $stringBuffer->append($sqlStatement);
                $stringBuffer->append($self->{sqlStrings}->{COLUMN_VALUE});
                $stringBuffer->append($column->toString());
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD_GET_COLUMN_WHERE});
            }
            return $column;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_GET_COLUMN_WHERE}, $e);
            }
            return $column;
        }
}

# use java::sql::ResultSet;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::init::db::DbConnectionInfo;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::communication::sql::AbSqlTable;

1;

