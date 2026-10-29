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

package org::allbinary::logic::communication::sql::AbSqlTableUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{TABLE_LABEL} = "Table: ";
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{sqlStrings} = 'org::allbinary::logic::communication::sql::SqlStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::sql::AbSqlTableUtil::instance;
}


sub backupTable {
    my ($self, $abSqlTable) = @_;
        my $tableName = $abSqlTable->getTableName();
        return $self->{TABLE_LABEL} . $tableName . " Backup Failed";
}


sub restoreTable {
    my ($self, $abSqlTable, $portion) = @_;
        my $tableName = $abSqlTable->getTableName();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{TABLE_LABEL});
        $stringBuffer->append($tableName);
        $stringBuffer->append(" Restoration Failed");
        return $stringBuffer->toString();
}

use org::allbinary::business::installer::Portion;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::sql::SqlStrings;

1;

