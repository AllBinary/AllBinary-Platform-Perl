# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
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

package org::allbinary::data::tables::generator::IdGeneratorEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::generator::IdGeneratorEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "idgenerator";
    $self->{tableData} = undef;
    $self->{NAME} = "NAME";
    $self->{VALUE} = "VALUE";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::UserDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->{tableData} = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{sqlStrings}->{CREATE_TABLE})->append($self->{tableName})->append($self->{sqlStrings}->{START})->append($self->{NAME})->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL})->append($self->{VALUE})->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL})->append($self->{sqlStrings}->{PRIMARY_KEY})->append($self->{NAME})->append($self->{sqlStrings}->{END})->toString();
        $self->SUPER::setTableName($self->{tableName});
    return $self;
}


# throws Exception
sub get {
    my ($self, $name) = @_;
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $keysAndValues->put($self->{NAME}, $name);
        my $hashMap = $self->SUPER::getRow($keysAndValues);
        if (($hashMap->get($self->{NAME}))->compareTo($name) != 0) {
            die ("results do not match");
        }
        my $value = $hashMap->get($self->{VALUE});
        return int($value);
}


sub insert {
    my ($self, $values) = @_;
        try {
            $self->SUPER::insert($values);
            $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{INSERT});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{INSERT}, $e);
        }
}


sub delete {
    my ($self, $value) = @_;
        try {
            $self->SUPER::deleteWhere($self->{NAME}, $value);
            $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{commonStrings}->{delete});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{delete}, $e);
        }
}


sub update {
    my ($self, $name, $value) = @_;
        my $map = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $map->put($self->{NAME}, $name);
        $map->put($self->{VALUE}, $value);
        $self->update($map);
}


# Java overloaded method: Perl keeps the last definition
sub update {
    my ($self, $hashMap) = @_;
        $self->SUPER::updateWhere($self->{NAME}, $hashMap->get($self->{NAME}), $hashMap);
}


sub createTable {
    my ($self) = @_;
        my $returnStr = $self->SUPER::createTable($self->{tableData});
        return $returnStr;
}


sub dropTable {
    my ($self) = @_;
        return $self->SUPER::dropTable();
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::data::tables::generator::IdGeneratorEntityInterface;

1;

