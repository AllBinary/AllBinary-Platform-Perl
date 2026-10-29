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

package org::allbinary::business::user::role::BasicUserRole;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::io::Serializable';

our $roleVector = 'org::allbinary::util::BasicArrayListD'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{m_int_RoleId} = undef;
    $self->{role} = undef;
    $self->{displayValue} = undef;
    $self->{sessionTimeout} = undef;
    $self->{sessionInactivityTimeout} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new4(@arguments) if scalar(@arguments) == 4;
    return $class->_new5(@arguments) if scalar(@arguments) == 5;
    die "No constructor of BasicUserRole takes " . scalar(@arguments) . " arguments";
}


sub _new4 {
    my ($class, $aRole, $a_int_RoleId, $aSessionTimeout, $aSessionInactivityTimeout) = @_;
    my $self = $class->_new5($aRole, $aRole, $a_int_RoleId, $aSessionTimeout, $aSessionInactivityTimeout);
        # this(...) made $self above
    return $self;
}


sub _new5 {
    my ($class, $aRole, $aDisplayValue, $a_int_RoleId, $aSessionTimeout, $aSessionInactivityTimeout) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{m_int_RoleId} = $a_int_RoleId;
        $self->{role} = $aRole;
        $self->{displayValue} = $aDisplayValue;
        $self->{sessionTimeout} = $aSessionTimeout;
        $self->{sessionInactivityTimeout} = $aSessionInactivityTimeout;
        $org::allbinary::business::user::role::BasicUserRole::roleVector->add($self);
    return $self;
}


sub getRoleId {
    my ($self) = @_;
        return $self->{m_int_RoleId};
}


sub getRole {
    my ($self) = @_;
        return $self->{role};
}


sub getSessionTimeout {
    my ($self) = @_;
        return $self->{sessionTimeout};
}


sub getSessionInactivityTimeout {
    my ($self) = @_;
        return $self->{sessionInactivityTimeout};
}


sub equals {
    my ($self, $basicUserRole) = @_;
        if ($self->getRoleId() == $basicUserRole->getRoleId()) {
            return 1;
        }
        return 0;
}


sub toString {
    my ($self) = @_;
        return $self->getRole();
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getRole {
    my ($class, $role) = @_;
        my $roleVector = 'org::allbinary::business::user::role::BasicUserRole'->getAll();
        my $size = $roleVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $userRole = $roleVector->get($index);
            if (($role cmp $userRole->toString()) == 0) {
                return $userRole;
            }
        }
        die ("Unable to get role - Unknown Role");
}


sub getAll {
    my ($class) = @_;
        return $org::allbinary::business::user::role::BasicUserRole::roleVector;
}

# use java::io::Serializable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

