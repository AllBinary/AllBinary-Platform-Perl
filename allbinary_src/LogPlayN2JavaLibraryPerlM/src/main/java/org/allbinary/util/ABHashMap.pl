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

package org::allbinary::util::ABHashMap;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::util::HashMap';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
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


sub get {
    my ($self, $key) = @_;
        return $self->SUPER::get($key);
}


sub containsKey {
    my ($self, $key) = @_;
        return $self->SUPER::containsKey($key);
}


sub put {
    my ($self, $key, $value) = @_;
        return $self->SUPER::put($key, $value);
}


sub putAll {
    my ($self, $map) = @_;
        $self->SUPER::putAll($map);
}


sub remove {
    my ($self, $key) = @_;
        return $self->SUPER::remove($key);
}


sub clear {
    my ($self) = @_;
        $self->SUPER::clear();
}


sub containsValue {
    my ($self, $value) = @_;
        return $self->SUPER::containsValue($value);
}


sub keySet {
    my ($self) = @_;
        return $self->SUPER::keySet();
}


sub entrySet {
    my ($self) = @_;
        return $self->SUPER::entrySet();
}


sub getOrDefault {
    my ($self, $key, $defaultValue) = @_;
        return $self->SUPER::getOrDefault($key, $defaultValue);
}


sub putIfAbsent {
    my ($self, $key, $value) = @_;
        return $self->SUPER::putIfAbsent($key, $value);
}


sub clone {
    my ($self) = @_;
        return $self->SUPER::clone();
}

use java::util::HashMap;
# use java::util::Map;
# use java::util::Set;
# use jsinterop::annotations::JsType;

1;

