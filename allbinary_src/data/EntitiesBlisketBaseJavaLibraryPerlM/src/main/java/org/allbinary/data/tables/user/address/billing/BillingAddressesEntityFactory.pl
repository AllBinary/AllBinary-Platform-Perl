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

package org::allbinary::data::tables::user::address::billing::BillingAddressesEntityFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::data::tables::user::address::billing::BillingAddressesEntityFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::data::tables::user::address::billing::BillingAddressesEntityFactory::instance;
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
            return 'org::allbinary::data::tables::user::address::billing::BillingAddressesEntity'->new($userName);
        } catch ($e) {
            if ($org::allbinary::data::tables::user::address::billing::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::user::address::billing::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{ENTITYFACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            return undef;
        }
}

use org::allbinary::data::tables::user::address::StreetAddressesEntity;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::data::tables::user::address::billing::BillingAddressesEntity;

1;

