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

package org::allbinary::graphics::OpenGLBitmapConfig;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{bitmapConfig} = undef;
}


sub new {
    my ($class, $bitmapConfig) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{bitmapConfig} = $bitmapConfig;
    return $self;
}

use java::lang::Object ();

1;

