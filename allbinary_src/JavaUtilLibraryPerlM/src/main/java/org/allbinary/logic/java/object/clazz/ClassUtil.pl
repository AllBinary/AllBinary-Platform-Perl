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

package org::allbinary::logic::java::anyType::clazz::ClassUtil;
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
    my ($class, $anyType, $lineBreak) = @_;
        if (defined($anyType)) {
            return 'org::allbinary::logic::java::anyType::clazz::ClassUtil'->viewAll(ref($anyType), $lineBreak);
        } else {
            return "Object Null";
        }
}


# Java overloaded method: Perl keeps the last definition
sub viewAll {
    my ($class, $myClass, $lineBreak) = @_;
        if (defined($myClass)) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            my $classes = $myClass->getClasses();
            $stringBuffer->append($lineBreak);
            $stringBuffer->append("Class: ");
            $stringBuffer->append($myClass->getName());
            $stringBuffer->append(" uses ");
            $stringBuffer->appendint(scalar(@{$classes}));
            $stringBuffer->append(" other classes");
            $stringBuffer->append($lineBreak);
            $stringBuffer->append($lineBreak);
            $stringBuffer->append("Classes: ");
            $stringBuffer->append($lineBreak);
            for (my $index = 0; $index < scalar(@{$classes}); $index++) {
                $stringBuffer->append("Class: ");
                $stringBuffer->append($classes->[$index]->getName());
                $stringBuffer->append($lineBreak);
            }
            $stringBuffer->append('org::allbinary::logic::java::anyType::InterfaceUtil'->viewAll($myClass, $lineBreak));
            $stringBuffer->append($lineBreak);
            $stringBuffer->append('org::allbinary::logic::java::anyType::ConstructorUtil'->viewAll($myClass, $lineBreak));
            $stringBuffer->append($lineBreak);
            $stringBuffer->append('org::allbinary::logic::java::anyType::MethodUtil'->viewAll($myClass, $lineBreak));
            return $stringBuffer->toString();
        } else {
            return "Class Null";
        }
}

use org::allbinary::logic::java::anyType::ConstructorUtil;
use org::allbinary::logic::java::anyType::InterfaceUtil;
use org::allbinary::logic::java::anyType::MethodUtil;
use org::allbinary::logic::string::StringMaker;

1;

