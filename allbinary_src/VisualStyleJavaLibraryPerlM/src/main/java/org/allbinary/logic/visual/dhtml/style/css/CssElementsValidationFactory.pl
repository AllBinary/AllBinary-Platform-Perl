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

package org::allbinary::logic::visual::dhtml::style::css::CssElementsValidationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $cssElementStyleNodeList) = @_;
        my $styles = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $cssElementStyleNodeList->size();
        my $cssElementStyleNode = undef;
        my $cssValidationInterface = undef;
        for (my $index = 0; $index < $size; $index++) {
            $cssElementStyleNode = $cssElementStyleNodeList->get($index);
            $cssValidationInterface = 'org::allbinary::logic::visual::dhtml::style::css::CssElementValidationFactory'->getInstance($cssElementStyleNode);
            $styles->add($cssValidationInterface);
        }
        return $styles;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($class, $hashMap) = @_;
        my $styles = 'org::allbinary::util::BasicArrayListD'->new();
        return $styles;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::control::validate::ValidationInterface;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::dhtml::style::css::CssElementValidationFactory;

1;

