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

package org::allbinary::game::midlet::DemoGameMidletStateFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $STATE, 'java::lang::LazyStatic', sub { 'org::allbinary::game::midlet::DemoGameMidletStateFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{NONE} = 'org::allbinary::game::midlet::DemoGameMidletState'->new();
    $self->{START_DEMO} = 'org::allbinary::game::midlet::DemoGameMidletState'->new();
    $self->{START_GAME} = 'org::allbinary::game::midlet::DemoGameMidletState'->new();
    $self->{START_INPUT_MAPPING} = 'org::allbinary::game::midlet::DemoGameMidletState'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::midlet::DemoGameMidletStateFactory::STATE;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::midlet::DemoGameMidletState ();

1;

