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

package org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $userName) = @_;
        try {
            return 'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity'->new($userName);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            if ($org::allbinary::data::tables::user::address::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::shipping::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "getShippingAddressesEntityInstance()", $e);
            }
            return undef;
        }
}

use org::allbinary::data::tables::user::address::StreetAddressesEntity;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity;

1;

