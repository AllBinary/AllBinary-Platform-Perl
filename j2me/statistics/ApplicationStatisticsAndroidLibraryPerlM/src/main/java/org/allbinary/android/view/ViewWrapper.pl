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

package org::allbinary::android::view::ViewWrapper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::view::BaseViewWrapper';


sub _init_fields {
    my ($self) = @_;
    $self->{view} = undef;
}


sub new {
    my ($class, $view) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{view} = $view;
    return $self;
}


sub invalidate {
    my ($self) = @_;
        $self->{view}->invalidate();
}


sub postInvalidate {
    my ($self) = @_;
        $self->{view}->postInvalidate();
}

use android::view::View;
use org::allbinary::android::view::BaseViewWrapper;

1;

