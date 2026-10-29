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

package org::allbinary::business::user::role::UserRole;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::io::Serializable';


sub _init_fields {
    my ($self) = @_;
    $self->{basicUserRole} = undef;
    $self->{userFactoryInterface} = undef;
}


sub new {
    my ($class, $aBasicUserRole, $aUserFactoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{basicUserRole} = $aBasicUserRole;
        $self->{userFactoryInterface} = $aUserFactoryInterface;
    return $self;
}


sub toString {
    my ($self) = @_;
        return $self->{basicUserRole}->toString();
}


sub getBasicUserRole {
    my ($self) = @_;
        return $self->{basicUserRole};
}


# throws Exception
sub getUserFactory {
    my ($self) = @_;
        return $self->{userFactoryInterface};
}


sub getSessionTimeout {
    my ($self) = @_;
        return $self->{basicUserRole}->getSessionTimeout();
}


sub getSessionInactivityTimeout {
    my ($self) = @_;
        return $self->{basicUserRole}->getSessionInactivityTimeout();
}

# use java::io::Serializable;
use org::allbinary::business::user::UserFactoryInterface;

1;

