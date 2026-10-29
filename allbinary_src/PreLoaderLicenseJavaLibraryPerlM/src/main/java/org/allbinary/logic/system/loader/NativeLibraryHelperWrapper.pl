#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
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

package org::allbinary::logic::system::loader::NativeLibraryHelperWrapper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{libraryName} = undef;
    $self->{loader} = undef;
    $self->{anyType} = undef;
}


sub new {
    my ($class, $libraryName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setLibraryName($libraryName);
    return $self;
}


# throws Exception
sub load {
    my ($self) = @_;
        my $params = [(undef) x (1)];
        $params->[0] = $self->getLibraryName();
        my $classes = [(undef) x (1)];
        $classes->[0] = ref($self->getLibraryName());
        $self->{loader} = 'org::allbinary::logic::system::loader::NativeLibraryClassLoader'->new(ref($self)->getClassLoader());
        my $myClass = $self->{loader}->loadClass("dynamic.NativeLibraryHelper");
        my $constructor = $myClass->getConstructor($classes);
        $self->{anyType} = $constructor->newInstance($params);
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $method = ref($self->{anyType})->getMethod($commonStrings->{LOAD}, undef);
        $method->invoke($self->{anyType}, undef);
}


sub unload {
    my ($self) = @_;
        $self->{anyType} = undef;
        $self->{loader} = undef;
        1;
        1;
}


sub toString {
    my ($self) = @_;
        return "Library: " . $self->getLibraryName();
}


sub getLibraryName {
    my ($self) = @_;
        return $self->{libraryName};
}


sub setLibraryName {
    my ($self, $libraryName) = @_;
        $self->{libraryName} = $libraryName;
}

# use java::lang::reflect::Constructor;
# use java::lang::reflect::Method;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::loader::NativeLibraryClassLoader;
use java::lang::System;

1;

