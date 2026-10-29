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

package org::allbinary::business::user::commerce::shipping::modules::UspsShippingModule;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::shipping::modules::ShippingInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = "USPS";
    $self->{description} = "Snail Mail";
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getCost {
    my ($self, $order) = @_;
        return 'org::allbinary::business::user::commerce::money::Money'->new();
}


sub getDescription {
    my ($self) = @_;
        return $self->{description};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}

use org::allbinary::business::user::commerce::inventory::order::OrderInterface;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::business::user::commerce::shipping::modules::ShippingInterface;

1;

