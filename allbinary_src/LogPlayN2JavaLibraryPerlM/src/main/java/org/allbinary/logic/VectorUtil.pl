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

package org::allbinary::logic::VectorUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::VectorUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::VectorUtil::instance;
}


sub getSize {
    my ($self, $anyType) = @_;
        my $vector = $anyType;
        return $vector->size();
}


sub elementAt {
    my ($self, $anyType, $index) = @_;
        my $vector = $anyType;
        return $vector->elementAt($index);
}

use java::util::Vector;
# use jsinterop::annotations::JsType;

1;

