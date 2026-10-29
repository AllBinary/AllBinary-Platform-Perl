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

package org::allbinary::util::ABHashtable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::util::Hashtable';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        # super(...) made $self above
    return $self;
}


sub size {
    my ($self) = @_;
        return $self->SUPER::size();
}


sub isEmpty {
    my ($self) = @_;
        return $self->SUPER::isEmpty();
}


sub elements {
    my ($self) = @_;
        return $self->SUPER::elements();
}


sub contains {
    my ($self, $value) = @_;
        return $self->SUPER::contains($value);
}


sub containsValue {
    my ($self, $value) = @_;
        return $self->SUPER::containsValue($value);
}


sub containsKey {
    my ($self, $key) = @_;
        return $self->SUPER::containsKey($key);
}


sub get {
    my ($self, $key) = @_;
        return $self->SUPER::get($key);
}


sub clear {
    my ($self) = @_;
        $self->SUPER::clear();
}


sub clone {
    my ($self) = @_;
        return $self->SUPER::clone();
}


sub toString {
    my ($self) = @_;
        return $self->SUPER::toString();
}


sub equals {
    my ($self, $obj) = @_;
        return $self->SUPER::equals($obj);
}


sub hashCode {
    my ($self) = @_;
        return $self->SUPER::hashCode();
}

use java::util::Enumeration;
use java::util::Hashtable;
# use java::util::Map;
# use java::util::Set;
# use jsinterop::annotations::JsType;

1;

