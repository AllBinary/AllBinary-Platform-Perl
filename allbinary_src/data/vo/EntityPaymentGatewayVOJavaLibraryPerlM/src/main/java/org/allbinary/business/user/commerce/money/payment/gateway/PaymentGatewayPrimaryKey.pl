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

package org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPrimaryKey;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::io::Serializable';


sub _init_fields {
    my ($self) = @_;
    $self->{storeName} = undef;
    $self->{name} = undef;
}


sub new {
    my ($class, $storeName, $gatewayName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setStoreName($storeName);
        $self->setName($gatewayName);
    return $self;
}


sub getStoreName {
    my ($self) = @_;
        return $self->{storeName};
}


sub setStoreName {
    my ($self, $storeName) = @_;
        $self->{storeName} = $storeName;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPrimaryKey'->getName());
        $stringBuffer->append('org::allbinary::business::context::modules::storefront::StoreFront'->getName());
        $stringBuffer->append(" =");
        $stringBuffer->append($self->getStoreName());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append('org::allbinary::business::user::commerce::money::payment::gateway::PaymentGateway'->getName());
        $stringBuffer->append("=");
        $stringBuffer->append($self->getName());
        return $stringBuffer->toString();
}

use org::allbinary::business::context::modules::storefront::StoreFront;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;

1;

