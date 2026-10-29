# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::math::NamedAngle;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::math::Angle';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
}


sub new {
    my ($class, $angle, $name) = @_;
    my $self = $class->SUPER::new($angle);
    $self->_init_fields();
        # super(...) made $self above
        $self->{name} = $name;
    return $self;
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsProperty;
# use jsinterop::annotations::JsConstructor;
use org::allbinary::math::Angle;

1;

