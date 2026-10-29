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

package org::allbinary::business::user::commerce::shipping::ShippingMethods;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::shipping::ShippingMethodsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{shippingVector} = undef;
    $self->{defaultShippingMethodInterface} = undef;
}


sub new {
    my ($class, $abeClientInformation, $storeFrontInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{defaultShippingMethodInterface} = 'org::allbinary::business::user::commerce::shipping::ShippingMethodsFactory'->new($abeClientInformation, $storeFrontInterface)->getDefaultInstance();
        $self->{shippingVector} = 'org::allbinary::business::user::commerce::shipping::ShippingMethodsFactory'->new($abeClientInformation, $storeFrontInterface)->getInstance();
    return $self;
}


sub get {
    my ($self) = @_;
        return $self->{shippingVector};
}


# throws Exception
sub getShippingInterface {
    my ($self, $name) = @_;
        my $shipping = undef;
        my $size = $self->{shippingVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            $shipping = $self->{shippingVector}->get($index);
            if (($name cmp $shipping->getName()) == 0) {
                return $shipping;
            }
        }
        my $error = "Error Finding Shipping: " . $name;
        if ($org::allbinary::business::user::commerce::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SHIPPINGERROR})) {
            $self->{logUtil}->putF($self->{commonStrings}->{EXCEPTION}, $self, "getShippingInterface(String name)");
        }
        die ($error);
}


# throws Exception
sub getDefault {
    my ($self) = @_;
        return $self->{defaultShippingMethodInterface};
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::shipping::modules::ShippingInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::business::user::commerce::shipping::ShippingMethodsInterface;
use org::allbinary::business::user::commerce::shipping::ShippingMethodsFactory;

1;

