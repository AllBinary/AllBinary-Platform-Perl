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

package org::allbinary::util::ABVector;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::util::Vector';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub ensureCapacity {
    my ($self, $minCapacity) = @_;
        $self->SUPER::ensureCapacity($minCapacity);
}


sub capacity {
    my ($self) = @_;
        return $self->SUPER::capacity();
}


sub size {
    my ($self) = @_;
        return $self->SUPER::size();
}


sub isEmpty {
    my ($self) = @_;
        return $self->SUPER::isEmpty();
}


sub contains {
    my ($self, $obj) = @_;
        return $self->SUPER::contains($obj);
}


sub indexOf {
    my ($self, $obj) = @_;
        return $self->SUPER::indexOf($obj);
}


sub lastIndexOf {
    my ($self, $obj) = @_;
        return $self->SUPER::lastIndexOf($obj);
}


sub elementAt {
    my ($self, $index) = @_;
        return $self->SUPER::elementAt($index);
}


sub firstElement {
    my ($self) = @_;
        return $self->SUPER::firstElement();
}


sub lastElement {
    my ($self) = @_;
        return $self->SUPER::lastElement();
}


sub setElementAt {
    my ($self, $obj, $index) = @_;
        $self->SUPER::setElementAt($obj, $index);
}


sub removeElementAt {
    my ($self, $index) = @_;
        $self->SUPER::removeElementAt($index);
}


sub addElement {
    my ($self, $obj) = @_;
        $self->SUPER::addElement($obj);
}


sub insertElementAt {
    my ($self, $obj, $index) = @_;
        $self->SUPER::insertElementAt($obj, $index);
}


sub removeElement {
    my ($self, $obj) = @_;
        return $self->SUPER::removeElement($obj);
}


sub removeAllElements {
    my ($self) = @_;
        $self->SUPER::removeAllElements();
}


sub clone {
    my ($self) = @_;
        return $self->SUPER::clone();
}


sub toArray {
    my ($self) = @_;
        return $self->SUPER::toArray();
}


sub set {
    my ($self, $index, $element) = @_;
        return $self->SUPER::set($index, $element);
}


sub add_j1 {
    my ($self, $element) = @_;
        return $self->SUPER::add($element);
}


sub remove_j1_1 {
    my ($self, $obj) = @_;
        return $self->SUPER::remove($obj);
}


sub add_j2 {
    my ($self, $index, $element) = @_;
        $self->SUPER::add($index, $element);
}

sub add {
    my ($invocant, @arguments) = @_;
    return $invocant->add_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->add_j2(@arguments) if scalar(@arguments) == 2;
    die "No method add takes " . scalar(@arguments) . " arguments";
}


sub remove_j1_2 {
    my ($self, $index) = @_;
        return $self->SUPER::remove($index);
}

sub remove {
    my ($invocant, @arguments) = @_;
    return $invocant->remove_j1(@arguments) if scalar(@arguments) == 1;
    die "No method remove takes " . scalar(@arguments) . " arguments";
}

sub remove_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->remove_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->remove_j1_2(@arguments);
}


sub clear {
    my ($self) = @_;
        $self->SUPER::clear();
}


sub equals {
    my ($self, $obj) = @_;
        return $self->SUPER::equals($obj);
}


sub hashCode {
    my ($self) = @_;
        return $self->SUPER::hashCode();
}


sub toString {
    my ($self) = @_;
        return $self->SUPER::toString();
}


sub removeRange {
    my ($self, $fromIndex, $toIndex) = @_;
        $self->SUPER::removeRange($fromIndex, $toIndex);
}

use java::lang::Object ();
use java::util::Vector ();
# use jsinterop::annotations::JsType ();

1;

