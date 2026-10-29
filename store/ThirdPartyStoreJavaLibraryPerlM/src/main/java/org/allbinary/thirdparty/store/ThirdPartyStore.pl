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

package org::allbinary::thirdparty::store::ThirdPartyStore;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{authorized} = 0;
    $self->{name} = undef;
}


sub new {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
    return $self;
}


sub authorize {
    my ($self, $clientInformationInterface) = @_;
}


sub isAuthorized {
    my ($self) = @_;
        return $self->{authorized};
}


sub setAuthorized {
    my ($self, $authorized) = @_;
        $self->{authorized} = $authorized;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}

use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;

1;

