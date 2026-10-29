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

package org::allbinary::business::context::modules::storefronts::BasicStoreFrontsEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::init::InitSql';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "storefronts";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::UserDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setTable($self->{tableName});
    return $self;
}


# throws Exception
sub getStoreFrontInterface {
    my ($self, $name) = @_;
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $keysAndValues->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $name);
        my $storeHashMap = $self->SUPER::getRow($keysAndValues);
        if (!defined($storeHashMap)) {
            die ("No Such Store: " . $name);
        }
        if ($org::allbinary::business::context::modules::storefronts::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::context::modules::storefronts::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{FACTORYERROR})) {
            $self->{logUtil}->putF("StoreFront: " . $storeHashMap->toString(), $self, "getStore()");
        }
        return 'org::allbinary::business::context::modules::storefronts::BasicStoreFront'->new($storeHashMap);
}

use java::util::HashMap;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::init::InitSql;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::business::context::modules::storefronts::BasicStoreFront;

1;

