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

package org::allbinary::business::user::modules::admin::AdminUserFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::business::user::UserFactoryInterface';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance_j0 {
    my ($self) = @_;
        return 'org::allbinary::business::user::modules::admin::AdminUser'->new();
}


# throws Exception
sub getInstance_j1 {
    my ($self, $hashMap) = @_;
        return 'org::allbinary::business::user::modules::admin::AdminUser'->new($hashMap);
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::util::HashMap ();
use org::allbinary::business::user::UserFactoryInterface ();
use org::allbinary::business::user::UserInterface ();
use org::allbinary::business::user::modules::admin::AdminUser ();

1;

