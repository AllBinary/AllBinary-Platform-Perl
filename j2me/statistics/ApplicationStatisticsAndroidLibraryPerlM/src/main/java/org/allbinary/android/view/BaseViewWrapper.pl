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

package org::allbinary::android::view::BaseViewWrapper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_VIEW_WRAPPER = 'org::allbinary::android::view::BaseViewWrapper'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub invalidate {
    my ($self) = @_;
}


sub postInvalidate {
    my ($self) = @_;
}


1;

