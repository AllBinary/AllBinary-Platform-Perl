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

package org::allbinary::input::motion::button::BaseTouchInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getList {
    my ($self) = @_;
        return $self->{basicArrayListUtil}->getImmutableInstance();
}


sub toString {
    my ($self) = @_;
        return ref($self);
}

use java::lang::Object ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListUtil ();

1;

