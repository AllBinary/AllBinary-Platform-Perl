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

package org::allbinary::logic::communication::sql::AbSqlTable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBasic';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = undef;
    $self->{METHOD_CREATED_TABLE} = "createTable()";
    $self->{METHOD_DROP_TABLE} = "dropTable()";
    $self->{TABLE_CREATION_SUCCESS} = "Table Creation Successful: ";
    $self->{DROPPED_SUCCESS} = " Dropped Successfully";
}


sub new {
    my ($class, $databaseConnectionInfoInterface) = @_;
    my $self = $class->SUPER::new($databaseConnectionInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub setTableName {
    my ($self, $tableName) = @_;
        $self->{tableName} = $tableName;
}


sub getTableName {
    my ($self) = @_;
        return $self->{tableName};
}


sub createTable {
    my ($self, $data) = @_;
        try {
            $self->executeSQLStatement($data);
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{TABLE_CREATION_SUCCESS} . $self->{tableName} . " with statement: " . $data, $self, $self->{METHOD_CREATED_TABLE});
            }
            return $self->{tableName} . $self->{sqlStrings}->{CREATE_RETURN};
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put("Table Creation Failed: " . $self->{tableName} . " with statement: " . $data, $self, $self->{METHOD_CREATED_TABLE}, $e);
            }
            return "Failed to Create " . $self->{tableName} . " table.";
        }
}


sub dropTable {
    my ($self) = @_;
        my $sqlStatement = $self->{sqlStrings}->{DROP_TABLE} . $self->{tableName};
        try {
            $self->executeSQLStatement($sqlStatement);
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{SUCCESS_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_DROP_TABLE});
            }
            return $self->{tableName} . $self->{DROPPED_SUCCESS};
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_DROP_TABLE}, $e);
            }
            return "Failed to Drop " . $self->{tableName} . " table.";
        }
}

use org::allbinary::business::init::db::DbConnectionInfo;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBasic;

1;

