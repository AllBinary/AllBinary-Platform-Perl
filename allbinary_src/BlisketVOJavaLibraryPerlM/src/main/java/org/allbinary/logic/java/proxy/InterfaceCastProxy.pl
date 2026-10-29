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

package org::allbinary::logic::java::proxy::InterfaceCastProxy;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::reflect::InvocationHandler';


sub _init_fields {
    my ($self) = @_;
    $self->{anyType} = undef;
}


sub new {
    my ($class, $anyType) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{anyType} = $anyType;
    return $self;
}


sub newInstance {
    my ($class, $anyType) = @_;
        return 'java::lang::reflect::Proxy'->newProxyInstance(ref($anyType)->getClassLoader(), ref($anyType)->getInterfaces(), 'org::allbinary::logic::java::proxy::InterfaceCastProxy'->new($anyType));
}


# throws Throwable
sub invoke {
    my ($self, $proxyObject, $proxyMethod, $proxyArgs) = @_;
        my $methodName = $proxyMethod->getName();
        my $realMethod = ref($self->{anyType})->getMethod($methodName, $proxyMethod->getParameterTypes());
        if (!$realMethod->isAccessible()) {
            $realMethod->setAccessible(1);
        }
        return $proxyMethod->invoke($self->{anyType}, $proxyArgs);
}

# use java::lang::reflect::Method;
# use java::lang::reflect::Proxy;

1;

