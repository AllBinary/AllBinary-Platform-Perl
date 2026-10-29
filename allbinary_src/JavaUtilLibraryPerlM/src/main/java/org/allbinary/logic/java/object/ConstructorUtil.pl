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

package org::allbinary::logic::java::anyType::ConstructorUtil;
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
        my $constructor = $myClass->getConstructors();
        $stringBuffer->append("Constructors: ");
        $stringBuffer->append($lineBreak);
        for (my $index = 0; $index < scalar(@{$constructor}); $index++) {
            $stringBuffer->append('org::allbinary::logic::java::anyType::ConstructorUtil'->view($constructor->[$index], $lineBreak));
        }
        return $stringBuffer->toString();
}


sub view {
    my ($class, $constructor, $lineBreak) = @_;
        if (defined($constructor)) {
            my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($constructor->getName());
            my $classes = $constructor->getParameterTypes();
            for (my $index = 0; $index < scalar(@{$classes}); $index++) {
                $stringBuffer->append($commonSeps->{SPACE});
                $stringBuffer->append($classes->[$index]->getName());
                $stringBuffer->append($commonSeps->{COLON});
                $stringBuffer->appendint($index);
            }
            $stringBuffer->append($lineBreak);
            return $stringBuffer->toString();
        } else {
            return "Constructor Null";
        }
}

# use java::lang::reflect::Constructor;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;

1;

