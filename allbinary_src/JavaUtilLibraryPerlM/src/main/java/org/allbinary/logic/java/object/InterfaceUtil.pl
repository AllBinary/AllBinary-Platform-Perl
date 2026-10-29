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

package org::allbinary::logic::java::anyType::InterfaceUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub viewAll {
    my ($class, $myClass, $lineBreak) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $interfaces = $myClass->getInterfaces();
        $stringBuffer->append($lineBreak);
        $stringBuffer->append("Interfaces: ");
        $stringBuffer->append($lineBreak);
        for (my $index = 0; $index < scalar(@{$interfaces}); $index++) {
            $stringBuffer->append("Interface: ");
            $stringBuffer->append($interfaces->[$index]->getName());
            $stringBuffer->append($lineBreak);
        }
        return $stringBuffer->toString();
}


sub getClass {
    my ($class, $interfaceName, $interfaces) = @_;
        if (defined($interfaceName) && defined($interfaces) && scalar(@{$interfaces}) > 0) {
            for (my $index = 0; $index < scalar(@{$interfaces}); $index++) {
                if ($interfaces->[$index]->getName()->indexOf($interfaceName) >= 0) {
                    return $interfaces->[$index];
                }
            }
        }
        return undef;
}


sub isImplemented {
    my ($class, $clazz, $anyType) = @_;
        my $classes = ref($anyType)->getInterfaces();
        for (my $index = 0; $index < scalar(@{$classes}); $index++) {
            if ($clazz->getName()->compareTo($classes->[$index]->getName()) == 0) {
                return 1;
            }
        }
        return 0;
}


# Java overloaded method: Perl keeps the last definition
sub isImplemented {
    my ($class, $className, $anyType) = @_;
        my $classes = ref($anyType)->getInterfaces();
        for (my $index = 0; $index < scalar(@{$classes}); $index++) {
            if ($classes->[$index]->getName()->indexOf($className) == 0) {
                return 1;
            }
        }
        return 0;
}


sub isImplementedView {
    my ($class, $clazz, $anyType) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $classes = ref($anyType)->getInterfaces();
        $stringBuffer->append("isImplementedView: \n");
        for (my $index = 0; $index < scalar(@{$classes}); $index++) {
            $stringBuffer->append($clazz->getName());
            $stringBuffer->append(" should be = ");
            $stringBuffer->append($classes->[$index]->getName());
            $stringBuffer->append($classes->[$index]->getName());
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        }
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;

1;

