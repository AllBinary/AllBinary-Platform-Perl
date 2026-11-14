# 
# AllBinary Open License Version 1 
# Copyright (c) 2026 AllBinary 
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

package org::allbinary::business::user::role::BasicUserRoles;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::role::BasicUserRoles'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{roleVector} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::role::BasicUserRoles::instance;
}


# throws Exception
sub getRole {
    my ($self, $role) = @_;
        my $roleVector = $self->getAll();
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
    my ($self) = @_;
        return $self->{roleVector};
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();

1;

