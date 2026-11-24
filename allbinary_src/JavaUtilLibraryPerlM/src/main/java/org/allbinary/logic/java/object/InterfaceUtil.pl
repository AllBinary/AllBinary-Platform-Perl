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
use parent -norequire,'java::lang::Object';



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


sub isImplemented_j2_1 {
    my ($class, $clazz, $anyType) = @_;
        my $classes = ref($anyType)->getInterfaces();
        for (my $index = 0; $index < scalar(@{$classes}); $index++) {
            if ((($clazz) =~ s/::/./gr)->compareTo($classes->[$index]->getName()) == 0) {
                return 1;
            }
        }
        return 0;
}


sub isImplemented_j2_2 {
    my ($class, $className, $anyType) = @_;
        my $classes = ref($anyType)->getInterfaces();
        for (my $index = 0; $index < scalar(@{$classes}); $index++) {
            if ($classes->[$index]->getName()->indexOf($className) == 0) {
                return 1;
            }
        }
        return 0;
}

sub isImplemented {
    my ($invocant, @arguments) = @_;
    return $invocant->isImplemented_j2(@arguments) if scalar(@arguments) == 2;
    die "No method isImplemented takes " . scalar(@arguments) . " arguments";
}

sub isImplemented_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->isImplemented_j2_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return $invocant->isImplemented_j2_2(@arguments);
}


sub isImplementedView {
    my ($class, $clazz, $anyType) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $classes = ref($anyType)->getInterfaces();
        $stringBuffer->append("isImplementedView: \n");
        for (my $index = 0; $index < scalar(@{$classes}); $index++) {
            $stringBuffer->append((($clazz) =~ s/::/./gr));
            $stringBuffer->append(" should be = ");
            $stringBuffer->append($classes->[$index]->getName());
            $stringBuffer->append($classes->[$index]->getName());
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        }
        return $stringBuffer->toString();
}

use java::lang::Object ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::string::CommonSeps ();

1;

