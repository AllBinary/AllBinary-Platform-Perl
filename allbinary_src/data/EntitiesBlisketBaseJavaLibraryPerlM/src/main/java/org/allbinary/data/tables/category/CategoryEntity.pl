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

package org::allbinary::data::tables::category::CategoryEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::category::CategoryEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "categories";
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of CategoryEntity takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $categoryFactoryInterface) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::InventoryDbInitInfo'->new());
    _init_fields($self);
        # super(...) made $self above
        $self->setTableName($self->{tableName});
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::InventoryDbInitInfo'->new());
    _init_fields($self);
        # super(...) made $self above
        $self->setTableName($self->{tableName});
    return $self;
}


sub insert_j1_1 {
    my ($self, $category) = @_;
        try {
            my $categoryVector = $category->toVector();
            my $values = 'org::allbinary::util::BasicArrayListD'->new();
            $values->add($categoryVector->get(0));
            $values->add($categoryVector->get(1));
            $self->SUPER::insert($values);
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, java::lang::Object::jstatic('org::allbinary::data::tables::category::CategoryEntity', 'INSERT'));
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, java::lang::Object::jstatic('org::allbinary::data::tables::category::CategoryEntity', 'INSERT'), $e);
            }
        }
}


sub delete {
    my ($self, $value) = @_;
        try {
            $self->SUPER::deleteWhere('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}, $value);
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{commonStrings}->{delete});
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{delete}, $e);
            }
        }
}


sub createTableStatement {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE});
        $stringBuffer->append($self->{tableName});
        $stringBuffer->append($self->{sqlStrings}->{START});
        $stringBuffer->append('org::allbinary::business::category::CategoryData'->getInstance()->{NAME});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::category::CategoryData'->getInstance()->{LEVEL});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{sqlStrings}->{PRIMARY_KEY});
        $stringBuffer->append('org::allbinary::business::category::CategoryData'->getInstance()->{NAME});
        $stringBuffer->append($self->{sqlStrings}->{END});
        return $stringBuffer->toString();
}


sub createTable {
    my ($self) = @_;
        return $self->SUPER::createTable($self->createTableStatement());
}


sub update {
    my ($self, $updatedValues) = @_;
        $self->SUPER::updateWhere('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}, $updatedValues->get('org::allbinary::business::category::CategoryData'->getInstance()->{NAME}), $updatedValues);
}


sub dropTable {
    my ($self) = @_;
        return $self->SUPER::dropTable();
}


sub insert_j1_2 {
    my ($self, $values) = @_;
        $self->SUPER::insert($values);
}

sub insert {
    my ($invocant, @arguments) = @_;
    return $invocant->insert_j1(@arguments) if scalar(@arguments) == 1;
    die "No method insert takes " . scalar(@arguments) . " arguments";
}

sub insert_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->insert_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->insert_j1_2(@arguments);
}

use java::lang::Object ();
use java::util::HashMap ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::business::category::Category ();
use org::allbinary::business::category::CategoryData ();
use org::allbinary::business::category::CategoryFactoryInterface ();
use org::allbinary::business::init::db::InventoryDbInitInfo ();
use org::allbinary::logic::StdUtil ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::communication::sql::AbSqlBean ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();

1;

