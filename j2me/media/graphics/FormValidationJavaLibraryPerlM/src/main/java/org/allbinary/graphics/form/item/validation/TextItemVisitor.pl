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

package org::allbinary::graphics::form::item::validation::TextItemVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::visitor::Visitor';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub visit {
    my ($self, $anyType) = @_;
        my $value = $anyType;
        if (length($value) < 2) {
            return 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE};
        } else {
            return 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE};
        }
}

use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::util::visitor::Visitor;

1;

