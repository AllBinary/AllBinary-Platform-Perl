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

package org::allbinary::business::init::InitInfoEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::init::InitSql';


sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "InitInfoEntity";
    $self->{NOTHING} = "NOTHING";
    $self->{tableName} = "initdata";
    $self->{tableData} = undef;
    $self->{NOT_IN_DB} = "Not In DB";
    $self->{METHOD_GET} = "get()";
    $self->{METHOD_IS} = "is()";
    $self->{METHOD_ADD} = "add()";
    $self->{CREATED_SUCCESS} = " Created Successfully";
    $self->{FAILED_TO_CREATE} = "Failed to create ";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::UserDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE});
        $stringBuffer->append($self->{tableName});
        $stringBuffer->append($self->{sqlStrings}->{START});
        $stringBuffer->append($self->{NOTHING});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::init::InitInfo'->getInstance()->{TESTING});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::init::InitInfo'->getInstance()->{TESTHTMLPATH});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::init::InitInfo'->getInstance()->{MAINPATH});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($self->{sqlStrings}->{PRIMARY_KEY});
        $stringBuffer->append($self->{NOTHING});
        $stringBuffer->append($self->{sqlStrings}->{END});
        $self->{tableData} = $stringBuffer->toString();
        $self->setTable($self->{tableName});
    return $self;
}


sub get {
    my ($self) = @_;
        try {
            my $keyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $keyAndValue->put($self->{NOTHING}, $self->{NOTHING});
            my $hashMap = $self->getRow($keyAndValue);
            if (defined($hashMap)) {
                'org::allbinary::business::init::InitInfo'->getInstance()->set($hashMap);
                return 1;
            } else {
                if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADER})) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{NOT_IN_DB}, $self->{NAME}, $self->{METHOD_GET});
                }
                return 0;
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self->{NAME}, $self->{METHOD_GET}, $e);
            }
            return 0;
        }
}


sub is {
    my ($self) = @_;
        try {
            my $keyAndValue = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $keyAndValue->put($self->{NOTHING}, $self->{NOTHING});
            my $hashMap = $self->getRow($keyAndValue);
            if (defined($hashMap)) {
                return 1;
            } else {
                if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADER})) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{NOT_IN_DB}, $self->{NAME}, $self->{METHOD_IS});
                }
                return 0;
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self->{NAME}, $self->{METHOD_IS}, $e);
            }
            return 0;
        }
}


sub update {
    my ($self) = @_;
        $self->updateWhere($self->{NOTHING}, $self->{NOTHING}, 'org::allbinary::business::init::InitInfo'->getInstance()->toHashMap());
}


sub add {
    my ($self) = @_;
        try {
            my $values = 'org::allbinary::util::BasicArrayListD'->new();
            $values->add($self->{NOTHING});
            $values->add('org::allbinary::business::init::InitInfo'->getInstance()->getTesting());
            $values->add('org::allbinary::business::init::InitInfo'->getInstance()->getTestHtmlPath());
            $values->add('org::allbinary::business::init::InitInfo'->getInstance()->getMainPath());
            $self->insert($values);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self->{NAME}, $self->{METHOD_ADD}, $e);
            }
        }
}


sub createTable {
    my ($self) = @_;
        if ($self->SUPER::createTable($self->{tableData})) {
            return $self->{tableName} . $self->{CREATED_SUCCESS};
        } else {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{FAILED_TO_CREATE});
            $stringBuffer->append($self->{tableData});
            $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
            return $stringBuffer->toString();
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::business::init::InitSql;
use org::allbinary::business::init::InitInfo;

1;

