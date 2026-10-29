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

package org::allbinary::logic::java::anyType::MethodUtil;
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
        my $method = $myClass->getMethods();
        $stringBuffer->append("Methods: ");
        $stringBuffer->append($lineBreak);
        for (my $index = 0; $index < scalar(@{$method}); $index++) {
            $stringBuffer->append($method->[$index]->getReturnType()->getName());
            $stringBuffer->append(" ");
            $stringBuffer->append($method->[$index]->getName());
            $stringBuffer->append("(");
            'org::allbinary::logic::java::anyType::ParamsUtil'->viewParams($method->[$index]->getParameterTypes());
            $stringBuffer->append(")");
            $stringBuffer->append($lineBreak);
        }
        return $stringBuffer->toString();
}

# use java::lang::reflect::Method;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::java::anyType::ParamsUtil;

1;

