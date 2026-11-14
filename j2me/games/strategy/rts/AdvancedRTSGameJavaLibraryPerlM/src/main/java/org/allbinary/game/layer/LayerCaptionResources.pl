# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
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

package org::allbinary::game::layer::LayerCaptionResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::game::layer::LayerCaptionResources'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{RESOURCE} = "/unit_message_bubbled_box.png";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::LayerCaptionResources::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}

use java::lang::Object ();
use java::lang::LazyStatic ();

1;

