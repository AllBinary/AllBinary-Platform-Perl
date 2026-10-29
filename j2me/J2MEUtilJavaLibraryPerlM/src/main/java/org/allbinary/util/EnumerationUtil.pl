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

#ArkTs does not have this.  So this is for the ArkTs build.
package org::allbinary::util::EnumerationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::util::EnumerationUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::util::EnumerationUtil::instance;
}


sub hasMoreElements {
    my ($self, $enumeration) = @_;
        return $enumeration->hasMoreElements();
}


sub nextElement {
    my ($self, $enumeration) = @_;
        return $enumeration->nextElement();
}


sub getAsArray {
    my ($self, $enumeration) = @_;
        my $basicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
        while ($self->hasMoreElements($enumeration)) {
            $basicArrayList->add($self->nextElement($enumeration));
        }
        return $basicArrayList->toArray();
}

# use jsinterop::annotations::JsType;
use java::util::Enumeration;
# use jsinterop::annotations::JsMethod;
use org::allbinary::util::BasicArrayListD;

1;

