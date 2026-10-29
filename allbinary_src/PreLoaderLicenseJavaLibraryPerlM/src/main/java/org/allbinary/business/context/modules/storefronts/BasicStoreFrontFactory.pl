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

package org::allbinary::business::context::modules::storefronts::BasicStoreFrontFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::context::modules::storefronts::BasicStoreFrontFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::context::modules::storefronts::BasicStoreFrontFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $storeName) = @_;
        try {
            my $storeFronts = 'org::allbinary::business::context::modules::storefronts::BasicStoreFrontsEntity'->new();
            return $storeFronts->getStoreFrontInterface($storeName);
        } catch ($e) {
            if ($org::allbinary::business::context::modules::storefronts::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::context::modules::storefronts::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{FACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            return undef;
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::business::context::modules::storefronts::BasicStoreFrontsEntity;

1;

