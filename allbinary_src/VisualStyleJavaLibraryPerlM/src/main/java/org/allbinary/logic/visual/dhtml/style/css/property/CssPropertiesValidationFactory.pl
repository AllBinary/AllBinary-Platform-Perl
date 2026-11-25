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

package org::allbinary::logic::visual::dhtml::style::css::property::CssPropertiesValidationFactory;
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


# throws Exception
sub getInstance_j1_1 {
    my ($class, $nodeList) = @_;
        my $propertiesVector = 'org::allbinary::util::BasicArrayListD'->new();
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $node = $nodeList->item($index);
            if ($node->getNodeName()->compareTo('org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyData'->getInstance()->{NAME}) == 0) {
                my $cssPropertyValidationInterface = 'org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyValidationFactory'->getInstance($node);
                $propertiesVector->add($cssPropertyValidationInterface);
            }
        }
        return $propertiesVector;
}


sub getInstance_j1_2 {
    my ($class, $hashMap) = @_;
        my $styles = 'org::allbinary::util::BasicArrayListD'->new();
        return $styles;
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

sub getInstance_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->getInstance_j1_2(@arguments);
}

use java::lang::Object ();
use java::util::HashMap ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::logic::StdUtil ();
use org::allbinary::logic::control::validate::ValidationInterface ();
use org::w3c::dom::Node ();
use org::w3c::dom::NodeList ();
use org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyData ();
use org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyValidationFactory ();

1;

