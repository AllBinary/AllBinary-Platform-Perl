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

package org::allbinary::math::Angle;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{value} = undef;
}


sub new {
    my ($class, $angle) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{value} = $angle;
    return $self;
}


sub getValue {
    my ($self) = @_;
        return $self->{value};
}

use java::lang::Object ();
# use jsinterop::annotations::JsType ();
# use jsinterop::annotations::JsMethod ();
# use jsinterop::annotations::JsConstructor ();

1;

